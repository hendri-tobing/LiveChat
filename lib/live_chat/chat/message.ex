defmodule LiveChat.Chat.Message do
  use Ecto.Schema
  import Ecto.Changeset

  schema "chat_messages" do
    field :context, :string

    belongs_to :user, LiveChat.Auth.User
    belongs_to :conversation, LiveChat.Chat.Conversation

    has_many :seen_message, LiveChat.Chat.SeenMessage
    has_many :message_reaction, LiveChat.Chat.MessageReaction

    timestamps()
  end

  @doc false
  def changeset(message, attrs) do
    message
    |> cast(attrs, [:context, :conversation_id, :user_id])
    |> validate_required([:context, :conversation_id, :user_id])
  end
end
