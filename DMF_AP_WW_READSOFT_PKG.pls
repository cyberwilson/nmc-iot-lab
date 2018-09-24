create or replace PACKAGE BODY               dmf_ap_ww_readsoft_pkg
AS

    PROCEDURE write_log(p_debug IN VARCHAR2, p_msg IN VARCHAR2)
    IS
    BEGIN
        IF p_debug = 'Y' THEN
           fnd_file.put_line(fnd_file.log, p_msg);
        END IF;
    END write_log;

    PROCEDURE write_output(p_msg IN VARCHAR2)
    IS
    BEGIN
        fnd_file.put_line(fnd_file.output, p_msg);
        fnd_file.put_line(fnd_file.log, p_msg);
    END write_output;

    PROCEDURE update_invoice(p_rowid IN VARCHAR2, p_rec_invoice IN ap_invoices_all%ROWTYPE)
    IS
    BEGIN
        --ap_invoices_pkg.update_row
        ap_ai_table_handler_pkg.update_row
        (
            p_rowid                             => p_rowid,
            p_invoice_id                        => p_rec_invoice.invoice_id,
            p_last_update_date                  => SYSDATE,
            p_last_updated_by                   => fnd_global.user_id,
            p_vendor_id                         => p_rec_invoice.vendor_id,
            p_invoice_num                       => p_rec_invoice.invoice_num,
            p_invoice_amount                    => p_rec_invoice.invoice_amount,
            p_vendor_site_id                    => p_rec_invoice.vendor_site_id,
            p_amount_paid                       => p_rec_invoice.amount_paid,
            p_discount_amount_taken             => p_rec_invoice.discount_amount_taken,
            p_invoice_date                      => p_rec_invoice.invoice_date,
            p_source                            => p_rec_invoice.source,
            p_invoice_type_lookup_code          => p_rec_invoice.invoice_type_lookup_code,
            p_description                       => p_rec_invoice.description,
            p_batch_id                          => p_rec_invoice.batch_id,
            p_amt_applicable_to_discount        => p_rec_invoice.amount_applicable_to_discount,
            p_terms_id                          => p_rec_invoice.terms_id,
            p_terms_date                        => p_rec_invoice.terms_date,
            p_goods_received_date               => p_rec_invoice.goods_received_date,
            p_invoice_received_date             => p_rec_invoice.invoice_received_date,
            p_voucher_num                       => p_rec_invoice.voucher_num,
            p_approved_amount                   => p_rec_invoice.approved_amount,
            p_approval_status                   => p_rec_invoice.approval_status,
            p_approval_description              => p_rec_invoice.approval_description,
            p_pay_group_lookup_code             => p_rec_invoice.pay_group_lookup_code,
            p_set_of_books_id                   => p_rec_invoice.set_of_books_id,
            p_accts_pay_ccid                    => p_rec_invoice.accts_pay_code_combination_id,
            p_recurring_payment_id              => p_rec_invoice.recurring_payment_id,
            p_invoice_currency_code             => p_rec_invoice.invoice_currency_code,
            p_payment_currency_code             => p_rec_invoice.payment_currency_code,
            p_exchange_rate                     => p_rec_invoice.exchange_rate,
            p_payment_amount_total              => p_rec_invoice.payment_amount_total,
            p_payment_status_flag               => p_rec_invoice.payment_status_flag,
            p_posting_status                    => p_rec_invoice.posting_status,
            p_authorized_by                     => p_rec_invoice.authorized_by,
            p_attribute_category                => p_rec_invoice.attribute_category,
            p_attribute1                        => p_rec_invoice.attribute1,
            p_attribute2                        => p_rec_invoice.attribute2,
            p_attribute3                        => p_rec_invoice.attribute3,
            p_attribute4                        => p_rec_invoice.attribute4,
            p_attribute5                        => p_rec_invoice.attribute5,
            p_vendor_prepay_amount              => p_rec_invoice.vendor_prepay_amount,
            p_base_amount                       => p_rec_invoice.base_amount,
            p_exchange_rate_type                => p_rec_invoice.exchange_rate_type,
            p_exchange_date                     => p_rec_invoice.exchange_date,
            p_payment_cross_rate                => p_rec_invoice.payment_cross_rate,
            p_payment_cross_rate_type           => p_rec_invoice.payment_cross_rate_type,
            p_payment_cross_rate_date           => p_rec_invoice.payment_cross_rate_date,
            p_pay_curr_invoice_amount           => p_rec_invoice.pay_curr_invoice_amount,
            p_last_update_login                 => fnd_global.conc_login_id,
            p_original_prepayment_amount        => p_rec_invoice.original_prepayment_amount,
            p_earliest_settlement_date          => p_rec_invoice.earliest_settlement_date,
            p_attribute11                       => p_rec_invoice.attribute11,
            p_attribute12                       => p_rec_invoice.attribute12,
            p_attribute13                       => p_rec_invoice.attribute13,
            p_attribute14                       => p_rec_invoice.attribute14,
            p_attribute6                        => p_rec_invoice.attribute6,
            p_attribute7                        => p_rec_invoice.attribute7,
            p_attribute8                        => p_rec_invoice.attribute8,
            p_attribute9                        => p_rec_invoice.attribute9,
            p_attribute10                       => p_rec_invoice.attribute10,
            p_attribute15                       => p_rec_invoice.attribute15,
            p_cancelled_date                    => p_rec_invoice.cancelled_date,
            p_cancelled_by                      => p_rec_invoice.cancelled_by,
            p_cancelled_amount                  => p_rec_invoice.cancelled_amount,
            p_temp_cancelled_amount             => p_rec_invoice.temp_cancelled_amount,
            p_exclusive_payment_flag            => p_rec_invoice.exclusive_payment_flag,
            p_po_header_id                      => p_rec_invoice.po_header_id,
            p_doc_sequence_id                   => p_rec_invoice.doc_sequence_id,
            p_doc_sequence_value                => p_rec_invoice.doc_sequence_value,
            p_doc_category_code                 => p_rec_invoice.doc_category_code,
            p_expenditure_item_date             => p_rec_invoice.expenditure_item_date,
            p_expenditure_organization_id       => p_rec_invoice.expenditure_organization_id,
            p_expenditure_type                  => p_rec_invoice.expenditure_type,
            p_pa_default_dist_ccid              => p_rec_invoice.pa_default_dist_ccid,
            p_pa_quantity                       => p_rec_invoice.pa_quantity,
            p_project_id                        => p_rec_invoice.project_id,
            p_task_id                           => p_rec_invoice.task_id,
            p_awt_flag                          => p_rec_invoice.awt_flag,
            p_awt_group_id                      => p_rec_invoice.awt_group_id,
            p_pay_awt_group_id                  => p_rec_invoice.pay_awt_group_id,
            p_reference_1                       => p_rec_invoice.reference_1,
            p_reference_2                       => p_rec_invoice.reference_2,
            p_org_id                            => p_rec_invoice.org_id,
            p_global_attribute_category         => p_rec_invoice.global_attribute_category,
            p_global_attribute1                 => p_rec_invoice.global_attribute1,
            p_global_attribute2                 => p_rec_invoice.global_attribute2,
            p_global_attribute3                 => p_rec_invoice.global_attribute3,
            p_global_attribute4                 => p_rec_invoice.global_attribute4,
            p_global_attribute5                 => p_rec_invoice.global_attribute5,
            p_global_attribute6                 => p_rec_invoice.global_attribute6,
            p_global_attribute7                 => p_rec_invoice.global_attribute7,
            p_global_attribute8                 => p_rec_invoice.global_attribute8,
            p_global_attribute9                 => p_rec_invoice.global_attribute9,
            p_global_attribute10                => p_rec_invoice.global_attribute10,
            p_global_attribute11                => p_rec_invoice.global_attribute11,
            p_global_attribute12                => p_rec_invoice.global_attribute12,
            p_global_attribute13                => p_rec_invoice.global_attribute13,
            p_global_attribute14                => p_rec_invoice.global_attribute14,
            p_global_attribute15                => p_rec_invoice.global_attribute15,
            p_global_attribute16                => p_rec_invoice.global_attribute16,
            p_global_attribute17                => p_rec_invoice.global_attribute17,
            p_global_attribute18                => p_rec_invoice.global_attribute18,
            p_global_attribute19                => p_rec_invoice.global_attribute19,
            p_global_attribute20                => p_rec_invoice.global_attribute20,
            p_calling_sequence                  => fnd_global.conc_request_id,
            p_gl_date                           => p_rec_invoice.gl_date,
            p_award_id                          => p_rec_invoice.award_id,
            p_approval_iteration                => p_rec_invoice.approval_iteration,
            p_approval_ready_flag               => p_rec_invoice.approval_ready_flag,
            p_wfapproval_status                 => p_rec_invoice.wfapproval_status,
            p_requester_id                      => p_rec_invoice.requester_id,
            p_quick_credit                      => p_rec_invoice.quick_credit,
            p_credited_invoice_id               => p_rec_invoice.credited_invoice_id,
            p_distribution_set_id               => p_rec_invoice.distribution_set_id,
            p_force_revalidation_flag           => p_rec_invoice.force_revalidation_flag,
            p_control_amount                    => p_rec_invoice.control_amount,
            p_tax_related_invoice_id            => p_rec_invoice.tax_related_invoice_id,
            p_trx_business_category             => p_rec_invoice.trx_business_category,
            p_user_defined_fisc_class           => p_rec_invoice.user_defined_fisc_class,
            p_taxation_country                  => p_rec_invoice.taxation_country,
            p_document_sub_type                 => p_rec_invoice.document_sub_type,
            p_supplier_tax_invoice_number       => p_rec_invoice.supplier_tax_invoice_number,
            p_supplier_tax_invoice_date         => p_rec_invoice.supplier_tax_invoice_date,
            p_supplier_tax_exchange_rate        => p_rec_invoice.supplier_tax_exchange_rate,
            p_tax_invoice_recording_date        => p_rec_invoice.tax_invoice_recording_date,
            p_tax_invoice_internal_seq          => p_rec_invoice.tax_invoice_internal_seq,
            p_quick_po_header_id                => p_rec_invoice.quick_po_header_id,
            p_payment_method_code               => p_rec_invoice.payment_method_code,
            p_payment_reason_code               => p_rec_invoice.payment_reason_code,
            p_payment_reason_comments           => p_rec_invoice.payment_reason_comments,
            p_unique_remittance_identifier      => p_rec_invoice.unique_remittance_identifier,
            p_uri_check_digit                   => p_rec_invoice.uri_check_digit,
            p_bank_charge_bearer                => p_rec_invoice.bank_charge_bearer,
            p_delivery_channel_code             => p_rec_invoice.delivery_channel_code,
            p_settlement_priority               => p_rec_invoice.settlement_priority,
            p_net_of_retainage_flag             => p_rec_invoice.net_of_retainage_flag,
            p_release_amount_net_of_tax         => p_rec_invoice.release_amount_net_of_tax,
            p_port_of_entry_code                => p_rec_invoice.port_of_entry_code,
            p_external_bank_account_id          => p_rec_invoice.external_bank_account_id,
            p_party_id                          => p_rec_invoice.party_id,
            p_party_site_id                     => p_rec_invoice.party_site_id,
            p_disc_is_inv_less_tax_flag         => p_rec_invoice.disc_is_inv_less_tax_flag,
            p_exclude_freight_from_disc         => p_rec_invoice.exclude_freight_from_discount,
            p_remit_msg1                        => p_rec_invoice.remittance_message1,
            p_remit_msg2                        => p_rec_invoice.remittance_message2,
            p_remit_msg3                        => p_rec_invoice.remittance_message3,
            p_remit_to_supplier_name            => p_rec_invoice.remit_to_supplier_name,
            p_remit_to_supplier_id              => p_rec_invoice.remit_to_supplier_id,
            p_remit_to_supplier_site            => p_rec_invoice.remit_to_supplier_site,
            p_remit_to_supplier_site_id         => p_rec_invoice.remit_to_supplier_site_id,
            p_relationship_id                   => p_rec_invoice.relationship_id,
            p_original_invoice_amount           => p_rec_invoice.original_invoice_amount,
            p_dispute_reason                    => p_rec_invoice.dispute_reason
        );
    END update_invoice;

    PROCEDURE update_invoice_lines(x_rowid IN OUT VARCHAR2, p_rec_inv_lines IN ap_invoice_lines_all%ROWTYPE)
    IS
    BEGIN
        ap_ail_table_handler_pkg.update_row
        (
            p_rowid                             => x_rowid,
            p_invoice_id                        => p_rec_inv_lines.invoice_id,
            p_line_number                       => p_rec_inv_lines.line_number,
            p_line_type_lookup_code             => p_rec_inv_lines.line_type_lookup_code,
            p_line_group_number                 => p_rec_inv_lines.line_group_number,
            p_requester_id                      => p_rec_inv_lines.requester_id,
            p_description                       => p_rec_inv_lines.description,
            p_line_source                       => p_rec_inv_lines.line_source,
            p_org_id                            => p_rec_inv_lines.org_id,
            p_inventory_item_id                 => p_rec_inv_lines.inventory_item_id,
            p_item_description                  => p_rec_inv_lines.item_description,
            p_serial_number                     => p_rec_inv_lines.serial_number,
            p_manufacturer                      => p_rec_inv_lines.manufacturer,
            p_model_number                      => p_rec_inv_lines.model_number,
            p_warranty_number                   => p_rec_inv_lines.warranty_number,
            p_generate_dists                    => p_rec_inv_lines.generate_dists,
            p_match_type                        => p_rec_inv_lines.match_type,
            p_distribution_set_id               => p_rec_inv_lines.distribution_set_id,
            p_account_segment                   => p_rec_inv_lines.account_segment,
            p_balancing_segment                 => p_rec_inv_lines.balancing_segment,
            p_cost_center_segment               => p_rec_inv_lines.cost_center_segment,
            p_overlay_dist_code_concat          => p_rec_inv_lines.overlay_dist_code_concat,
            p_default_dist_ccid                 => p_rec_inv_lines.default_dist_ccid,
            p_prorate_across_all_items          => p_rec_inv_lines.prorate_across_all_items,
            p_accounting_date                   => p_rec_inv_lines.accounting_date,
            p_period_name                       => p_rec_inv_lines.period_name,
            p_deferred_acctg_flag               => p_rec_inv_lines.deferred_acctg_flag,
            p_def_acctg_start_date              => p_rec_inv_lines.def_acctg_start_date,
            p_def_acctg_end_date                => p_rec_inv_lines.def_acctg_end_date,
            p_def_acctg_number_of_periods       => p_rec_inv_lines.def_acctg_number_of_periods,
            p_def_acctg_period_type             => p_rec_inv_lines.def_acctg_period_type,
            p_set_of_books_id                   => p_rec_inv_lines.set_of_books_id,
            p_amount                            => p_rec_inv_lines.amount,
            p_base_amount                       => p_rec_inv_lines.base_amount,
            p_rounding_amt                      => p_rec_inv_lines.rounding_amt,
            p_quantity_invoiced                 => p_rec_inv_lines.quantity_invoiced,
            p_unit_meas_lookup_code             => p_rec_inv_lines.unit_meas_lookup_code,
            p_unit_price                        => p_rec_inv_lines.unit_price,
            p_wfapproval_status                 => p_rec_inv_lines.wfapproval_status,
            p_discarded_flag                    => p_rec_inv_lines.discarded_flag,
            p_original_amount                   => p_rec_inv_lines.original_amount,
            p_original_base_amount              => p_rec_inv_lines.original_base_amount,
            p_original_rounding_amt             => p_rec_inv_lines.original_rounding_amt,
            p_cancelled_flag                    => p_rec_inv_lines.cancelled_flag,
            p_income_tax_region                 => p_rec_inv_lines.income_tax_region,
            p_type_1099                         => p_rec_inv_lines.type_1099,
            p_stat_amount                       => p_rec_inv_lines.stat_amount,
            p_prepay_invoice_id                 => p_rec_inv_lines.prepay_invoice_id,
            p_prepay_line_number                => p_rec_inv_lines.prepay_line_number,
            p_invoice_includes_prepay_flag      => p_rec_inv_lines.invoice_includes_prepay_flag,
            p_corrected_inv_id                  => p_rec_inv_lines.corrected_inv_id,
            p_corrected_line_number             => p_rec_inv_lines.corrected_line_number,
            p_po_header_id                      => p_rec_inv_lines.po_header_id,
            p_po_line_id                        => p_rec_inv_lines.po_line_id,
            p_po_release_id                     => p_rec_inv_lines.po_release_id,
            p_po_line_location_id               => p_rec_inv_lines.po_line_location_id,
            p_po_distribution_id                => p_rec_inv_lines.po_distribution_id,
            p_rcv_transaction_id                => p_rec_inv_lines.rcv_transaction_id,
            p_final_match_flag                  => p_rec_inv_lines.final_match_flag,
            p_assets_tracking_flag              => p_rec_inv_lines.assets_tracking_flag,
            p_asset_book_type_code              => p_rec_inv_lines.asset_book_type_code,
            p_asset_category_id                 => p_rec_inv_lines.asset_category_id,
            p_project_id                        => p_rec_inv_lines.project_id,
            p_task_id                           => p_rec_inv_lines.task_id,
            p_expenditure_type                  => p_rec_inv_lines.expenditure_type,
            p_expenditure_item_date             => p_rec_inv_lines.expenditure_item_date,
            p_expenditure_organization_id       => p_rec_inv_lines.expenditure_organization_id,
            p_pa_quantity                       => p_rec_inv_lines.pa_quantity,
            p_pa_cc_ar_invoice_id               => p_rec_inv_lines.pa_cc_ar_invoice_id,
            p_pa_cc_ar_invoice_line_num         => p_rec_inv_lines.pa_cc_ar_invoice_line_num,
            p_pa_cc_processed_code              => p_rec_inv_lines.pa_cc_processed_code,
            p_award_id                          => p_rec_inv_lines.award_id,
            p_awt_group_id                      => p_rec_inv_lines.awt_group_id,
            p_pay_awt_group_id                  => p_rec_inv_lines.pay_awt_group_id,
            p_reference_1                       => p_rec_inv_lines.reference_1,
            p_reference_2                       => p_rec_inv_lines.reference_2,
            p_receipt_verified_flag             => p_rec_inv_lines.receipt_verified_flag,
            p_receipt_required_flag             => p_rec_inv_lines.receipt_required_flag,
            p_receipt_missing_flag              => p_rec_inv_lines.receipt_missing_flag,
            p_justification                     => p_rec_inv_lines.justification,
            p_expense_group                     => p_rec_inv_lines.expense_group,
            p_start_expense_date                => p_rec_inv_lines.start_expense_date,
            p_end_expense_date                  => p_rec_inv_lines.end_expense_date,
            p_receipt_currency_code             => p_rec_inv_lines.receipt_currency_code,
            p_receipt_conversion_rate           => p_rec_inv_lines.receipt_conversion_rate,
            p_receipt_currency_amount           => p_rec_inv_lines.receipt_currency_amount,
            p_daily_amount                      => p_rec_inv_lines.daily_amount,
            p_web_parameter_id                  => p_rec_inv_lines.web_parameter_id,
            p_adjustment_reason                 => p_rec_inv_lines.adjustment_reason,
            p_merchant_document_number          => p_rec_inv_lines.merchant_document_number,
            p_merchant_name                     => p_rec_inv_lines.merchant_name,
            p_merchant_reference                => p_rec_inv_lines.merchant_reference,
            p_merchant_tax_reg_number           => p_rec_inv_lines.merchant_tax_reg_number,
            p_merchant_taxpayer_id              => p_rec_inv_lines.merchant_taxpayer_id,
            p_country_of_supply                 => p_rec_inv_lines.country_of_supply,
            p_credit_card_trx_id                => p_rec_inv_lines.credit_card_trx_id,
            p_company_prepaid_invoice_id        => p_rec_inv_lines.company_prepaid_invoice_id,
            p_cc_reversal_flag                  => p_rec_inv_lines.cc_reversal_flag,
            p_creation_date                     => p_rec_inv_lines.creation_date,
            p_created_by                        => p_rec_inv_lines.created_by,
            p_last_updated_by                   => fnd_global.user_id,
            p_last_update_date                  => SYSDATE,
            p_last_update_login                 => fnd_global.conc_login_id,
            p_program_application_id            => p_rec_inv_lines.program_application_id,
            p_program_id                        => fnd_global.conc_program_id,
            p_program_update_date               => SYSDATE,
            p_request_id                        => fnd_global.conc_request_id,
            p_attribute_category                => p_rec_inv_lines.attribute_category,
            p_attribute1                        => p_rec_inv_lines.attribute1,
            p_attribute2                        => p_rec_inv_lines.attribute2,
            p_attribute3                        => p_rec_inv_lines.attribute3,
            p_attribute4                        => p_rec_inv_lines.attribute4,
            p_attribute5                        => p_rec_inv_lines.attribute5,
            p_attribute6                        => p_rec_inv_lines.attribute6,
            p_attribute7                        => p_rec_inv_lines.attribute7,
            p_attribute8                        => p_rec_inv_lines.attribute8,
            p_attribute9                        => p_rec_inv_lines.attribute9,
            p_attribute10                       => p_rec_inv_lines.attribute10,
            p_attribute11                       => p_rec_inv_lines.attribute11,
            p_attribute12                       => p_rec_inv_lines.attribute12,
            p_attribute13                       => p_rec_inv_lines.attribute13,
            p_attribute14                       => p_rec_inv_lines.attribute14,
            p_attribute15                       => p_rec_inv_lines.attribute15,
            p_global_attribute_category         => p_rec_inv_lines.global_attribute_category,
            p_global_attribute1                 => p_rec_inv_lines.global_attribute1,
            p_global_attribute2                 => p_rec_inv_lines.global_attribute2,
            p_global_attribute3                 => p_rec_inv_lines.global_attribute3,
            p_global_attribute4                 => p_rec_inv_lines.global_attribute4,
            p_global_attribute5                 => p_rec_inv_lines.global_attribute5,
            p_global_attribute6                 => p_rec_inv_lines.global_attribute6,
            p_global_attribute7                 => p_rec_inv_lines.global_attribute7,
            p_global_attribute8                 => p_rec_inv_lines.global_attribute8,
            p_global_attribute9                 => p_rec_inv_lines.global_attribute9,
            p_global_attribute10                => p_rec_inv_lines.global_attribute10,
            p_global_attribute11                => p_rec_inv_lines.global_attribute11,
            p_global_attribute12                => p_rec_inv_lines.global_attribute12,
            p_global_attribute13                => p_rec_inv_lines.global_attribute13,
            p_global_attribute14                => p_rec_inv_lines.global_attribute14,
            p_global_attribute15                => p_rec_inv_lines.global_attribute15,
            p_global_attribute16                => p_rec_inv_lines.global_attribute16,
            p_global_attribute17                => p_rec_inv_lines.global_attribute17,
            p_global_attribute18                => p_rec_inv_lines.global_attribute18,
            p_global_attribute19                => p_rec_inv_lines.global_attribute19,
            p_global_attribute20                => p_rec_inv_lines.global_attribute20,
            p_primary_intended_use              => p_rec_inv_lines.primary_intended_use,
            p_ship_to_location_id               => p_rec_inv_lines.ship_to_location_id,
            p_product_fisc_classification       => p_rec_inv_lines.product_fisc_classification,
            p_user_defined_fisc_class           => p_rec_inv_lines.user_defined_fisc_class,
            p_trx_business_category             => p_rec_inv_lines.trx_business_category,
            p_product_type                      => p_rec_inv_lines.product_type,
            p_product_category                  => p_rec_inv_lines.product_category,
            p_assessable_value                  => p_rec_inv_lines.assessable_value,
            p_control_amount                    => p_rec_inv_lines.control_amount,
            p_tax_regime_code                   => p_rec_inv_lines.tax_regime_code,
            p_tax                               => p_rec_inv_lines.tax,
            p_tax_status_code                   => p_rec_inv_lines.tax_status_code,
            p_tax_rate_code                     => p_rec_inv_lines.tax_rate_code,
            p_tax_rate_id                       => p_rec_inv_lines.tax_rate_id,
            p_tax_rate                          => p_rec_inv_lines.tax_rate,
            p_tax_jurisdiction_code             => p_rec_inv_lines.tax_jurisdiction_code,
            p_purchasing_category_id            => p_rec_inv_lines.purchasing_category_id,
            p_cost_factor_id                    => p_rec_inv_lines.cost_factor_id,
            p_retained_amount                   => p_rec_inv_lines.retained_amount,
            p_retained_invoice_id               => p_rec_inv_lines.retained_invoice_id,
            p_retained_line_number              => p_rec_inv_lines.retained_line_number,
            p_tax_classification_code           => p_rec_inv_lines.tax_classification_code,
            p_calling_sequence                  => fnd_global.conc_request_id
        );
    END update_invoice_lines;

    PROCEDURE update_invoice_distributions(x_rowid IN OUT VARCHAR2, p_rec_inv_dist IN ap_invoice_distributions_all%ROWTYPE)
    IS
    BEGIN
        ap_aid_table_handler_pkg.update_row
        (
            p_rowid                                => x_rowid,
            p_invoice_id                           => p_rec_inv_dist.invoice_id,
            p_invoice_line_number                  => p_rec_inv_dist.invoice_line_number,
            p_distribution_class                   => p_rec_inv_dist.distribution_class,
            p_dist_code_combination_id             => p_rec_inv_dist.dist_code_combination_id,
            p_last_update_date                     => p_rec_inv_dist.last_update_date,
            p_last_updated_by                      => p_rec_inv_dist.last_updated_by,
            p_accounting_date                      => p_rec_inv_dist.accounting_date,
            p_period_name                          => p_rec_inv_dist.period_name,
            p_set_of_books_id                      => p_rec_inv_dist.set_of_books_id,
            p_amount                               => p_rec_inv_dist.amount,
            p_description                          => p_rec_inv_dist.description,
            p_type_1099                            => p_rec_inv_dist.type_1099,
            p_posted_flag                          => p_rec_inv_dist.posted_flag,
            p_batch_id                             => p_rec_inv_dist.batch_id,
            p_quantity_invoiced                    => p_rec_inv_dist.quantity_invoiced,
            p_unit_price                           => p_rec_inv_dist.unit_price,
            p_match_status_flag                    => p_rec_inv_dist.match_status_flag,
            p_attribute_category                   => p_rec_inv_dist.attribute_category,
            p_attribute1                           => p_rec_inv_dist.attribute1,
            p_attribute2                           => p_rec_inv_dist.attribute2,
            p_attribute3                           => p_rec_inv_dist.attribute3,
            p_attribute4                           => p_rec_inv_dist.attribute4,
            p_attribute5                           => p_rec_inv_dist.attribute5,
            p_prepay_amount_remaining              => p_rec_inv_dist.prepay_amount_remaining,
            p_assets_addition_flag                 => p_rec_inv_dist.assets_addition_flag,
            p_assets_tracking_flag                 => p_rec_inv_dist.assets_tracking_flag,
            p_distribution_line_number             => p_rec_inv_dist.distribution_line_number,
            p_line_type_lookup_code                => p_rec_inv_dist.line_type_lookup_code,
            p_po_distribution_id                   => p_rec_inv_dist.po_distribution_id,
            p_base_amount                          => p_rec_inv_dist.base_amount,
            p_pa_addition_flag                     => p_rec_inv_dist.pa_addition_flag,
            p_posted_amount                        => p_rec_inv_dist.posted_amount,
            p_posted_base_amount                   => p_rec_inv_dist.posted_base_amount,
            p_encumbered_flag                      => p_rec_inv_dist.encumbered_flag,
            p_accrual_posted_flag                  => p_rec_inv_dist.accrual_posted_flag,
            p_cash_posted_flag                     => p_rec_inv_dist.cash_posted_flag,
            p_last_update_login                    => p_rec_inv_dist.last_update_login,
            p_stat_amount                          => p_rec_inv_dist.stat_amount,
            p_attribute11                          => p_rec_inv_dist.attribute11,
            p_attribute12                          => p_rec_inv_dist.attribute12,
            p_attribute13                          => p_rec_inv_dist.attribute13,
            p_attribute14                          => p_rec_inv_dist.attribute14,
            p_attribute6                           => p_rec_inv_dist.attribute6,
            p_attribute7                           => p_rec_inv_dist.attribute7,
            p_attribute8                           => p_rec_inv_dist.attribute8,
            p_attribute9                           => p_rec_inv_dist.attribute9,
            p_attribute10                          => p_rec_inv_dist.attribute10,
            p_attribute15                          => p_rec_inv_dist.attribute15,
            p_accts_pay_code_comb_id               => p_rec_inv_dist.accts_pay_code_combination_id,
            p_reversal_flag                        => p_rec_inv_dist.reversal_flag,
            p_parent_invoice_id                    => p_rec_inv_dist.parent_invoice_id,
            p_income_tax_region                    => p_rec_inv_dist.income_tax_region,
            p_final_match_flag                     => p_rec_inv_dist.final_match_flag,
            p_expenditure_item_date                => p_rec_inv_dist.expenditure_item_date,
            p_expenditure_organization_id          => p_rec_inv_dist.expenditure_organization_id,
            p_expenditure_type                     => p_rec_inv_dist.expenditure_type,
            p_pa_quantity                          => p_rec_inv_dist.pa_quantity,
            p_project_id                           => p_rec_inv_dist.project_id,
            p_task_id                              => p_rec_inv_dist.task_id,
            p_quantity_variance                    => p_rec_inv_dist.quantity_variance,
            p_base_quantity_variance               => p_rec_inv_dist.base_quantity_variance,
            p_packet_id                            => p_rec_inv_dist.packet_id,
            p_awt_flag                             => p_rec_inv_dist.awt_flag,
            p_awt_group_id                         => p_rec_inv_dist.awt_group_id,
            p_pay_awt_group_id                     => p_rec_inv_dist.pay_awt_group_id,
            p_awt_tax_rate_id                      => p_rec_inv_dist.awt_tax_rate_id,
            p_awt_gross_amount                     => p_rec_inv_dist.awt_gross_amount,
            p_reference_1                          => p_rec_inv_dist.reference_1,
            p_reference_2                          => p_rec_inv_dist.reference_2,
            p_org_id                               => p_rec_inv_dist.org_id,
            p_other_invoice_id                     => p_rec_inv_dist.other_invoice_id,
            p_awt_invoice_id                       => p_rec_inv_dist.awt_invoice_id,
            p_awt_origin_group_id                  => p_rec_inv_dist.awt_origin_group_id,
            p_program_application_id               => p_rec_inv_dist.program_application_id,
            p_program_id                           => p_rec_inv_dist.program_id,
            p_program_update_date                  => p_rec_inv_dist.program_update_date,
            p_request_id                           => p_rec_inv_dist.request_id,
            p_tax_recoverable_flag                 => p_rec_inv_dist.tax_recoverable_flag,
            p_award_id                             => p_rec_inv_dist.award_id,
            p_start_expense_date                   => p_rec_inv_dist.start_expense_date,
            p_merchant_document_number             => p_rec_inv_dist.merchant_document_number,
            p_merchant_name                        => p_rec_inv_dist.merchant_name,
            p_merchant_tax_reg_number              => p_rec_inv_dist.merchant_tax_reg_number,
            p_merchant_taxpayer_id                 => p_rec_inv_dist.merchant_taxpayer_id,
            p_country_of_supply                    => p_rec_inv_dist.country_of_supply,
            p_merchant_reference                   => p_rec_inv_dist.merchant_reference,
            p_global_attribute_category            => p_rec_inv_dist.global_attribute_category,
            p_global_attribute1                    => p_rec_inv_dist.global_attribute1,
            p_global_attribute2                    => p_rec_inv_dist.global_attribute2,
            p_global_attribute3                    => p_rec_inv_dist.global_attribute3,
            p_global_attribute4                    => p_rec_inv_dist.global_attribute4,
            p_global_attribute5                    => p_rec_inv_dist.global_attribute5,
            p_global_attribute6                    => p_rec_inv_dist.global_attribute6,
            p_global_attribute7                    => p_rec_inv_dist.global_attribute7,
            p_global_attribute8                    => p_rec_inv_dist.global_attribute8,
            p_global_attribute9                    => p_rec_inv_dist.global_attribute9,
            p_global_attribute10                   => p_rec_inv_dist.global_attribute10,
            p_global_attribute11                   => p_rec_inv_dist.global_attribute11,
            p_global_attribute12                   => p_rec_inv_dist.global_attribute12,
            p_global_attribute13                   => p_rec_inv_dist.global_attribute13,
            p_global_attribute14                   => p_rec_inv_dist.global_attribute14,
            p_global_attribute15                   => p_rec_inv_dist.global_attribute15,
            p_global_attribute16                   => p_rec_inv_dist.global_attribute16,
            p_global_attribute17                   => p_rec_inv_dist.global_attribute17,
            p_global_attribute18                   => p_rec_inv_dist.global_attribute18,
            p_global_attribute19                   => p_rec_inv_dist.global_attribute19,
            p_global_attribute20                   => p_rec_inv_dist.global_attribute20,
            p_calling_sequence                     => fnd_global.conc_request_id,
            p_rounding_amt                         => p_rec_inv_dist.rounding_amt,
            p_charge_applicable_to_dist_id         => p_rec_inv_dist.charge_applicable_to_dist_id,
            p_corrected_invoice_dist_id            => p_rec_inv_dist.corrected_invoice_dist_id,
            p_related_id                           => p_rec_inv_dist.related_id,
            p_asset_book_type_code                 => p_rec_inv_dist.asset_book_type_code,
            p_asset_category_id                    => p_rec_inv_dist.asset_category_id,
            p_intended_use                         => p_rec_inv_dist.intended_use
        );
    END update_invoice_distributions;

    FUNCTION bank_site_exists(p_site_id IN NUMBER, p_org_id IN NUMBER)
    RETURN VARCHAR2
    IS
        l_chr_rtn               VARCHAR2(1) := 'N';
    BEGIN
        SELECT 'Y'
        INTO   l_chr_rtn
        FROM   iby_payee_assigned_bankacct_v ipa,
               iby_account_owners iao
        WHERE  ipa.supplier_site_id = p_site_id
        AND    ipa.org_id = p_org_id
        AND    ipa.ext_bank_account_id = iao.ext_bank_account_id
        AND    ipa.party_id = iao.account_owner_party_id
        AND    ROWNUM = 1
        AND    TRUNC(NVL(ipa.end_date, SYSDATE)) >= TRUNC(SYSDATE)
        AND    TRUNC(NVL(iao.end_date, SYSDATE)) >= TRUNC(SYSDATE);

        RETURN l_chr_rtn;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
             RETURN l_chr_rtn;
    END bank_site_exists;

    FUNCTION po_matched_lines(p_invoice_id IN NUMBER)
    RETURN VARCHAR2
    IS
        l_chr_rtn               VARCHAR2(1) := 'N';
    BEGIN
        SELECT 'Y'
        INTO   l_chr_rtn
        FROM   ap_invoice_lines
        WHERE  invoice_id = p_invoice_id
        AND    po_header_id IS NOT NULL
        AND    match_type = 'ITEM_TO_PO'
        AND    ROWNUM = 1;

        RETURN l_chr_rtn;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
             RETURN l_chr_rtn;
    END po_matched_lines;

    FUNCTION is_invoice_duplicate(p_vendor_id IN NUMBER, p_invoice_id IN NUMBER, p_invoice_num IN VARCHAR2)
    RETURN VARCHAR2
    IS
        l_chr_rtn               VARCHAR2(1) := 'N';
    BEGIN
        SELECT 'Y'
        INTO   l_chr_rtn
        FROM   ap_invoices_all
        WHERE  vendor_id = p_vendor_id
        AND    invoice_num = p_invoice_num
        AND    invoice_id != p_invoice_id
        AND    invoice_amount > 0
        AND    set_of_books_id IN (1, 269)
        AND    ROWNUM = 1;

        RETURN l_chr_rtn;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
             RETURN l_chr_rtn;
    END is_invoice_duplicate;

    PROCEDURE process_invoices(x_errbuf OUT VARCHAR2, x_retcode OUT NUMBER,
                               p_sob_id IN NUMBER,
                               p_debug IN VARCHAR2 DEFAULT 'N')
    IS
        l_chr_us_hold           VARCHAR2(30) := 'US PO-matched Invoice';
        l_chr_us_dup_hold       VARCHAR2(30) := 'US Duplicate Invoice';

        l_chr_sob               gl_ledgers.short_name%TYPE;
        l_rec_invoice           ap_invoices%ROWTYPE;
        l_rec_invoice_dist      ap_invoice_distributions%ROWTYPE;
        l_rec_tax_dist          ap_invoice_distributions%ROWTYPE;

        l_num_holds             NUMBER;
        l_chr_msg               VARCHAR2(4000);
        l_chr_status            VARCHAR2(50);

        l_num_conc              NUMBER := fnd_global.conc_request_id;

        /*
        l_num_user              NUMBER;
        l_num_resp              NUMBER;
        l_num_app               NUMBER;

        l_num_reqid             NUMBER;
        l_complete              BOOLEAN;
        l_phase                 VARCHAR2(100);
        l_status                VARCHAR2(100);
        l_dev_phase             VARCHAR2(100);
        l_dev_status            VARCHAR2(100);
        l_message               VARCHAR2(100);


        CURSOR cur_org IS
           SELECT ai.org_id
           FROM   ap_invoices_all ai
           WHERE  1 = 1
           AND    ai.source = 'PROCESSIT'
           AND    ai.global_attribute20 IS NULL
           AND    ai.set_of_books_id = p_sob_id
           AND    ai.creation_date >= '17-SEP-2015'
           AND    ai.creation_date > TRUNC(SYSDATE - 7)
           AND    ap_invoices_pkg.get_posting_status(ai.invoice_id) = 'N'
           AND EXISTS (SELECT 1
                       FROM   dmf_ap_ww_org_resp_v org
                       WHERE  org.organization_id = ai.org_id)
           GROUP BY ai.org_id;
        */

        CURSOR cur_inv IS
           SELECT ai.rowid row_id, ai.invoice_id,
                  (SELECT name
                   FROM   ap.ap_awt_groups awt
                   WHERE  awt.group_id = ai.awt_group_id) awt_name
           FROM   ap_invoices ai
           WHERE  1 = 1
           AND    ai.source = 'PROCESSIT'
           --AND    ai.org_id = p_orgid
           AND    ai.global_attribute20 IS NULL
           --AND    ai.set_of_books_id = p_sob_id
           AND    ai.creation_date >= '17-SEP-2015'
           AND    ai.creation_date > TRUNC(SYSDATE - 7)
           AND    ap_invoices_pkg.get_posting_status(ai.invoice_id) = 'N'
           AND (
                -- Chile invoices must be validated
                EXISTS (SELECT 1
                        FROM   gl_ledgers sob
                        WHERE  sob.ledger_id = ai.set_of_books_id --p_sob_id
                        AND    sob.short_name = 'CHILELOC'
                        AND    'APPROVED' = ap_invoices_pkg.get_approval_status(ai.invoice_id,
                                                                                ai.invoice_amount,
                                                                                ai.payment_status_flag,
                                                                                ai.invoice_type_lookup_code))
                OR
                -- Guatemala, Costa Rica
                EXISTS (SELECT 1
                        FROM   gl_ledgers sob
                        WHERE  sob.ledger_id = ai.set_of_books_id --p_sob_id
                        AND    sob.short_name IN ('GUATLOC', 'CRLOC')
                        AND    ap_invoices_pkg.get_approval_status(ai.invoice_id,
                                                                                      ai.invoice_amount,
                                                                                      ai.payment_status_flag,
                                                                                      ai.invoice_type_lookup_code)
                                              IN ('NEVER APPROVED','UNAPPROVED')
                      )
                OR
                -- US, Canada
                EXISTS (SELECT 1
                        FROM   gl_ledgers sob
                        WHERE  sob.ledger_id = ai.set_of_books_id --p_sob_id
                        AND    sob.short_name IN ('Canada', 'NorthAmerica')
                        AND NOT EXISTS (SELECT 1
                                        FROM   ap_holds ah
                                        WHERE  ah.invoice_id = ai.invoice_id)
                        AND    'APPROVED' = ap_invoices_pkg.get_approval_status(ai.invoice_id,
                                                                                ai.invoice_amount,
                                                                                ai.payment_status_flag,
                                                                                ai.invoice_type_lookup_code))
               );

        CURSOR cur_inv_dist(p_inv_id IN NUMBER) IS
           SELECT aid.rowid row_id
           FROM   ap_invoice_distributions aid
           WHERE  aid.invoice_id = p_inv_id
           AND EXISTS (SELECT 1
                       FROM   ap_invoice_lines ail
                       WHERE  ail.invoice_id = aid.invoice_id
                       AND    ail.line_number = aid.invoice_line_number
                       AND    ail.line_type_lookup_code = 'ITEM');

        CURSOR cur_inv_dist_tax(p_inv_id IN NUMBER, p_dist_id IN NUMBER) IS
           SELECT aid.rowid row_id
           FROM   ap_invoice_distributions aid
           WHERE  aid.charge_applicable_to_dist_id = p_dist_id
           AND    aid.invoice_id = p_inv_id
           AND    aid.line_type_lookup_code = 'REC_TAX'
           AND EXISTS (SELECT 1
                       FROM   ap_invoice_lines ail
                       WHERE  ail.invoice_id = aid.invoice_id
                       AND    ail.line_number = aid.invoice_line_number
                       AND    ail.line_type_lookup_code = 'TAX');
        /*
        CURSOR cur_inv_lines(p_inv_id IN NUMBER) IS
           SELECT ail.rowid row_id
           FROM   ap_invoice_lines_all ail
           WHERE  ail.invoice_id= p_inv_id
           AND    ail.line_type_lookup_code = 'ITEM';
        */


    v_gt_count_tax number;
    v_gt_line_number number;
    v_gt_tax_class varchar2(100);
    v_gt_account_gl varchar2(10);

    BEGIN
        /*
        -- Get SOB Name
        SELECT short_name
        INTO   l_chr_sob
        FROM   gl_ledgers
        WHERE  ledger_id = p_sob_id;

        fnd_file.put_line(fnd_file.output, 'Ledger Name: ' || l_chr_sob);
        */
        write_output('================================================================================');
        write_output('Invoice No          | Org ID | Invoice Date | Error Message');
        write_output('================================================================================');

        /*
        -- Org Loop
        FOR rec_org IN cur_org LOOP

            SELECT user_id, responsibility_id, application_id
            INTO   l_num_user, l_num_resp, l_num_app
            FROM   dmf_ap_ww_org_resp_v
            WHERE  organization_id = rec_org.org_id;

            write_log(p_debug, 'Initialize Org: ' || rec_org.org_id);
            -- Initialize org context
            fnd_global.apps_initialize(user_id => l_num_user, resp_id => l_num_resp, resp_appl_id => l_num_app);
        */
            -- Invoices loop
            FOR rec_inv IN cur_inv LOOP

                SAVEPOINT trx;

                -- Init
                l_chr_msg := 'Processed';

                BEGIN
                    -- Get invoice record
                    SELECT ai.*
                    INTO   l_rec_invoice
                    FROM   ap_invoices ai
                    WHERE  ai.invoice_id = rec_inv.invoice_id;

                    write_log(p_debug, 'Processing invoice: ' || l_rec_invoice.invoice_num || ',' || l_rec_invoice.org_id);

                    -- Get SOB Name
                    SELECT short_name
                    INTO   l_chr_sob
                    FROM   gl_ledgers
                    WHERE  ledger_id = l_rec_invoice.set_of_books_id;

                    -- Override values based on SOB, DFF
                    -- Guatemala SOB
                    -- ************************************************************************ --
                    IF l_chr_sob = 'GUATLOC' THEN

                       -- Update AWT for Guatemala
                       UPDATE ap_invoice_lines ai
                       SET    awt_group_id = NVL(ai.attribute3, awt_group_id),
                              last_updated_by = fnd_global.user_id,
                              last_update_date = SYSDATE,
                              last_update_login = fnd_global.login_id,
                              request_id = l_num_conc
                       WHERE  ai.invoice_id = rec_inv.invoice_id
                       AND    ai.line_type_lookup_code IN ('ITEM', 'MISCELLANEOUS');

                       -- Update CERO AWT for Guatemala
                       UPDATE ap_invoice_lines ai
                       SET    awt_group_id = NULL,
                              last_updated_by = fnd_global.user_id,
                              last_update_date = SYSDATE,
                              last_update_login = fnd_global.login_id,
                              request_id = l_num_conc
                       WHERE  ai.invoice_id = rec_inv.invoice_id
                       AND    ai.line_type_lookup_code IN ('ITEM', 'MISCELLANEOUS')
                       AND EXISTS (SELECT 1
                                   FROM   ap_awt_groups awt
                                   WHERE  awt.group_id = ai.awt_group_id
                                   AND    awt.name = 'CERO');

                       -- If payment method is electronic but site has no bank account, default to CHECK
                       IF l_rec_invoice.global_attribute1 = 'EFT' AND bank_site_exists(l_rec_invoice.vendor_site_id, l_rec_invoice.org_id) = 'N' THEN
                          l_rec_invoice.global_attribute1 := 'CHECK';
                       END IF;

                       -- If AWT = CERO, remove it
                       IF rec_inv.awt_name = 'CERO' THEN
                          l_rec_invoice.awt_group_id := NULL;
                       END IF;

                       -- Update payment method and liability account
                       l_rec_invoice.payment_method_code := NVL(l_rec_invoice.global_attribute1, l_rec_invoice.payment_method_code);
                       l_rec_invoice.accts_pay_code_combination_id := NVL(l_rec_invoice.global_attribute3, l_rec_invoice.accts_pay_code_combination_id);

                       -- Update payment schedule
                       UPDATE ap_payment_schedules
                       SET    payment_method_code = NVL(l_rec_invoice.global_attribute1, payment_method_code)
                       WHERE  invoice_id = l_rec_invoice.invoice_id;

                       --Start Change by Luis Delgado Request 22901
                         select COUNT(*) into v_gt_count_tax
                         from   ap_invoice_lines a
                         where A.invoice_id=l_rec_invoice.invoice_id
                           and A.line_type_lookup_code = 'MISCELLANEOUS'
                           and a.description='Tax variance diff line';

                         if v_gt_count_tax>0 then
                            begin
                            select --line_number,org_id||'-'||TAX_CLASSIFICATION_CODE into v_gt_line_number,v_gt_tax_class
                                line_number into v_gt_line_number
                            from   ap_invoice_lines a
                            where A.invoice_id=l_rec_invoice.invoice_id
                             and A.line_type_lookup_code = 'MISCELLANEOUS'
                             and a.description='Tax variance diff line';
                            exception
                             when others then v_gt_tax_class:=null;
                                              v_gt_line_number:=null;
                            end;

                            --Start Change by Luis Delgado Request 69797 must be take the tax clasificaction code of the first line of the invoice
                            begin
                            select org_id||'-'||TAX_CLASSIFICATION_CODE into v_gt_tax_class
                            from   ap_invoice_lines a
                            where A.invoice_id=l_rec_invoice.invoice_id
                              and a.line_number=1;
                            exception
                             when others then v_gt_tax_class:=null;
                            end;
                            --End Change by Luis Delgado Request 69797


                             begin
                             select inf.description into v_gt_account_gl
                             from FND_FLEX_VALUES_TL INF,fnd_flex_values FFV,fnd_flex_value_sets ffvs
                             where ffv.flex_value_id=INF.flex_value_id
                               AND ffv.flex_value_set_id=ffvs.flex_value_set_id
                               and INF.language=USERENV ('LANG')
                               AND FFV.enabled_flag='Y'
                               and ffvs.flex_value_set_name='DMF AP GT TAX'
                               AND INF.FLEX_VALUE_MEANING=v_gt_tax_class ;
                             exception
                              when others then v_gt_account_gl:=null;
                             end;

                             if v_gt_account_gl IS NOT NULL then
                                update  ap_invoice_lines a
                                set DEFAULT_DIST_CCID=v_gt_account_gl
                                where A.invoice_id=l_rec_invoice.invoice_id
                                  and A.line_type_lookup_code = 'MISCELLANEOUS'
                                  and a.description='Tax variance diff line';

                                update ap_invoice_distributions
                                set DIST_CODE_COMBINATION_ID=v_gt_account_gl
                                where invoice_id=l_rec_invoice.invoice_id
                                  and invoice_line_number=v_gt_line_number;
                             end if;
                         end if;
                       --End Change by Luis Delgado Request 22901


                    END IF;

                    -- Costa Rica SOB
                    -- ************************************************************************ --
                    IF l_chr_sob = 'CRLOC' THEN
                       -- Update pay group, payment method, approval description
                       l_rec_invoice.pay_group_lookup_code := NVL(SUBSTR(l_rec_invoice.global_attribute2, 1, 25), l_rec_invoice.pay_group_lookup_code);
                       l_rec_invoice.payment_method_code := NVL(l_rec_invoice.global_attribute1, l_rec_invoice.payment_method_code);
                       l_rec_invoice.approval_description := NVL(l_rec_invoice.global_attribute4, l_rec_invoice.approval_description);

                       -- Update payment schedule
                       UPDATE ap_payment_schedules
                       SET    payment_method_code = NVL(l_rec_invoice.global_attribute1, payment_method_code)
                       WHERE  invoice_id = l_rec_invoice.invoice_id;

                    END IF;

                    -- Chile SOB
                    -- ************************************************************************ --
                    IF l_chr_sob = 'CHILELOC' THEN
                       -- Update pay group
                       l_rec_invoice.pay_group_lookup_code := NVL(SUBSTR(l_rec_invoice.global_attribute5, 1, 25), l_rec_invoice.pay_group_lookup_code);
                    END IF;

                    -- Flag to mark invoice as processed
                    l_rec_invoice.global_attribute20 := l_num_conc;

                    write_log(p_debug, 'Updating invoice header');
                    -- Update invoice record
                    update_invoice(rec_inv.row_id, l_rec_invoice);

                    -- For Chile, update tax lines DFF based on related item lines
                    -- ************************************************************************ --
                    IF l_chr_sob = 'CHILELOC' THEN
                        -- Invoice dist loop
                        FOR rec_inv_dist IN cur_inv_dist(rec_inv.invoice_id) LOOP
                            -- Get invoice dist record
                            SELECT aid.*
                            INTO   l_rec_invoice_dist
                            FROM   ap_invoice_distributions aid
                            WHERE  aid.rowid = rec_inv_dist.row_id;

                            -- Copy DFF values from ITEM dist if available
                            IF l_rec_invoice_dist.attribute_category = 'Grower' THEN
                                FOR rec_inv_tax IN cur_inv_dist_tax(l_rec_invoice_dist.invoice_id, l_rec_invoice_dist.invoice_distribution_id) LOOP

                                    /*
                                    UPDATE ap_invoice_distributions
                                    SET    attribute_category = l_rec_invoice_dist.attribute_category,
                                           attribute1 = l_rec_invoice_dist.attribute1,
                                           attribute2 = l_rec_invoice_dist.attribute4,
                                           attribute3 = l_rec_invoice_dist.attribute3,
                                           description = TRIM(description),
                                           last_updated_by = fnd_global.user_id,
                                           last_update_date = SYSDATE,
                                           last_update_login = fnd_global.login_id,
                                           request_id = l_num_conc
                                    WHERE  ROWID = rec_inv_tax.row_id;
                                    */

                                    -- Get invoice tax dist record
                                    SELECT aid.*
                                    INTO   l_rec_tax_dist
                                    FROM   ap_invoice_distributions aid
                                    WHERE  aid.rowid = rec_inv_tax.row_id;

                                    -- Copy DFF into tax lines
                                    l_rec_tax_dist.attribute_category := l_rec_invoice_dist.attribute_category;
                                    l_rec_tax_dist.attribute1 := l_rec_invoice_dist.attribute1;
                                    l_rec_tax_dist.attribute2 := l_rec_invoice_dist.attribute4;
                                    l_rec_tax_dist.attribute3 := l_rec_invoice_dist.attribute3;
                                    l_rec_tax_dist.request_id := l_num_conc;

                                    write_log(p_debug, 'Updating tax dist DFF: ' || l_rec_tax_dist.invoice_distribution_id);
                                    -- Update invoice tax dist record
                                    update_invoice_distributions(rec_inv_tax.row_id, l_rec_tax_dist);

                                END LOOP;
                            END IF;
                        END LOOP;
                    END IF;

                    -- Check attribute if invoice needs to be validated
                    --IF NVL(l_rec_invoice.global_attribute19, 'N') = 'Y' AND l_chr_sob IN ('GUATLOC', 'CRLOC') THEN
                    -- Revised By: John Mark de Villa
                    -- Date: 15-Sep-2015
                    -- Purpose: Validate only for CR/GUAT OU starting on cut-off date
                    -- ************************************************************************ --
                    IF (l_chr_sob IN ('CRLOC') AND TRUNC(l_rec_invoice.creation_date) >= '21-SEP-2015') OR
                       (l_chr_sob IN ('GUATLOC') AND TRUNC(l_rec_invoice.creation_date) >= '16-NOV-2015') THEN

                       write_log(p_debug, 'Validating invoice');
                       /*
                       l_num_reqid := fnd_request.submit_request(application => 'SQLAP',
                                                                 program     => 'APPRVL',
                                                                 argument1   => l_rec_invoice.org_id,
                                                                 argument2   => 'All',
                                                                 argument3   => '',
                                                                 argument4   => '',
                                                                 argument5   => '',
                                                                 argument6   => '',
                                                                 argument7   => '',
                                                                 argument8   => l_rec_invoice.invoice_id,
                                                                 argument9   => '',
                                                                 argument10  => l_rec_invoice.set_of_books_id,
                                                                 argument11  => 'N',
                                                                 argument12  => '1000',
                                                                 argument13  => '',
                                                                 argument14  => p_debug
                                                                );

                       COMMIT;

                       l_complete := fnd_concurrent.wait_for_request(request_id      => l_num_reqid,
                                                                     interval        => 5,
                                                                     max_wait        => 3600,
                                                                     phase           => l_phase,
                                                                     status          => l_status,
                                                                     dev_phase       => l_dev_phase,
                                                                     dev_status      => l_dev_status,
                                                                     message         => l_message
                                                                    );
                       write_log(p_debug, 'Request ID, Status: ' || l_num_reqid || ',' || l_phase);
                       */

                       -- Validate invoice
                       IF ap_approval_pkg.batch_approval
                              (
                                 p_run_option           => NULL,
                                 p_sob_id               => l_rec_invoice.set_of_books_id,
                                 p_inv_start_date       => NULL,
                                 p_inv_end_date         => NULL,
                                 p_inv_batch_id         => NULL,
                                 p_vendor_id            => NULL,
                                 p_pay_group            => NULL,
                                 p_invoice_id           => l_rec_invoice.invoice_id,
                                 p_entered_by           => NULL,
                                 p_debug_switch         => 'N',
                                 p_conc_request_id      => l_num_conc,
                                 p_commit_size          => NULL,
                                 p_org_id               => l_rec_invoice.org_id,
                                 p_report_holds_count   => l_num_holds,
                                 p_transaction_num      => NULL
                              ) THEN
                          NULL;
                       END IF;

                       -- Get invoice status
                       l_chr_status := ap_invoices_pkg.get_approval_status(l_rec_invoice.invoice_id,
                                                                           l_rec_invoice.invoice_amount,
                                                                           l_rec_invoice.payment_status_flag,
                                                                           l_rec_invoice.invoice_type_lookup_code);

                       l_chr_msg := l_chr_msg || ', Validation Result: ' || l_chr_status;

                       -- Update validation flag to make sure it's NULL due to API bug
                       UPDATE ap_invoices
                       SET    validation_request_id = NULL
                       WHERE  invoice_id = l_rec_invoice.invoice_id
                       AND    validation_request_id IS NOT NULL;

                    --ELSE
                    --    COMMIT;
                    END IF;

                    -- Revised By: John Mark de Villa
                    -- Date: 24-Nov-2015
                    -- Purpose: For US PO-matched lines, apply hold
                    -- ************************************************************************ --
                    IF l_chr_sob IN ('Canada', 'NorthAmerica') THEN
                       IF po_matched_lines(l_rec_invoice.invoice_id) = 'Y' THEN
                          ap_holds_pkg.insert_single_hold(X_invoice_id         => l_rec_invoice.invoice_id,
                                                          X_hold_lookup_code   => l_chr_us_hold);
                       END IF;
                       -- Revised By: John Mark de Villa
                       -- Date: 29-Feb-2016
                       -- Purpose: Check for duplicate across SOB, OU
                       -- ************************************************************************ --
                       IF is_invoice_duplicate(l_rec_invoice.vendor_id, l_rec_invoice.invoice_id, l_rec_invoice.invoice_num) = 'Y' THEN
                          ap_holds_pkg.insert_single_hold(X_invoice_id         => l_rec_invoice.invoice_id,
                                                          X_hold_lookup_code   => l_chr_us_dup_hold);
                       END IF;
                    END IF;

                    -- Trim the descriptions
                    UPDATE ap_invoices
                    SET    description = TRIM(description)
                    WHERE  invoice_id = l_rec_invoice.invoice_id;

                    UPDATE ap_invoice_lines
                    SET    description = TRIM(description)
                    WHERE  invoice_id = l_rec_invoice.invoice_id;

                    UPDATE ap_invoice_distributions
                    SET    description = TRIM(description)
                    WHERE  invoice_id = l_rec_invoice.invoice_id;

                EXCEPTION
                    WHEN OTHERS THEN
                         l_chr_msg := SUBSTR('SQL: ' || SQLERRM, 1, 4000);
                         ROLLBACK TO SAVEPOINT trx;
                END;

                write_output(RPAD(l_rec_invoice.invoice_num, 20) || '| ' ||
                             RPAD(l_rec_invoice.org_id, 7) || '| ' ||
                             RPAD(l_rec_invoice.invoice_date, 13) || '| ' ||
                             l_chr_msg);

            END LOOP;

        --END LOOP;

        COMMIT;

        write_output('================================================================================');
        write_output('End of Report');

    EXCEPTION
        WHEN OTHERS THEN
             ROLLBACK;
             x_retcode := -1;
             x_errbuf := 'SQL Error: ' || SQLERRM;
    END process_invoices;

END dmf_ap_ww_readsoft_pkg;