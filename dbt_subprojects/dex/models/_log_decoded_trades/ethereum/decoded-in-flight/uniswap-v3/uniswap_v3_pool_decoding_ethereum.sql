{{ config(

        schema = 'dex_mass_decoding_ethereum',
        alias = 'uniswap_v3_pool_evt_Swap',
        partition_by = ['block_date'],
        materialized = 'incremental',
        file_format = 'delta',
        incremental_strategy = 'merge',
        unique_key = ['tx_hash', 'index'],
        incremental_predicates = [incremental_predicate('DBT_INTERNAL_DEST.block_time')]
        )
}}

{{uniswap_v3_pool_mass_decoding(
        logs = source('ethereum', 'logs')
)}}