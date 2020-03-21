# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     LiveChat.Repo.insert!(%LiveChat.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias LiveChat.Auth.User
alias LiveChat.Chat.{Conversation, ConversationMember}

alias LiveChat.{Auth, Chat}

{:ok, %User{id: u1_id}} = Auth.create_user(%{name: "User One"})
{:ok, %User{id: u2_id}} = Auth.create_user(%{name: "User Two"})

{:ok, %Conversation{id: conv_id}} = Chat.create_conversation(%{title: "Modern Talking"})

{:ok, %ConversationMember{}} =
  Chat.create_conversation_member(%{conversation_id: conv_id, user_id: u1_id, owner: true})

{:ok, %ConversationMember{}} =
  Chat.create_conversation_member(%{conversation_id: conv_id, user_id: u2_id, owner: false})
