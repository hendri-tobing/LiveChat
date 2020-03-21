defmodule LiveChat.Chat.Conversation do
  use Ecto.Schema
  import Ecto.Changeset

  schema "chat_conversations" do
    field :title, :string

    has_many :conversation_members, LiveChat.Chat.ConversationMember
    has_many :messages, LiveChat.Chat.Message

    timestamps()
  end

  @doc false
  def changeset(conversation, attrs) do
    conversation
    |> cast(attrs, [:title])
    |> validate_required([:title])
  end
end
