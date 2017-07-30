with conversations as (

    select * from {{ ref('purecloud_conversation') }}

),

participants as (

    select * from {{ ref('purecloud_conversation_participants') }}

),

sessions as (

    select * from {{ ref('purecloud_conversation_participants_sessions') }}

),

segments as (

    select * from {{ ref('purecloud_conversation_participants_sessions_segments') }}

)

select *
from conversations
join participants using (conversation_id)
join sessions using (conversation_id, participant_index)
join segments using(conversation_id, participant_index, session_index)
