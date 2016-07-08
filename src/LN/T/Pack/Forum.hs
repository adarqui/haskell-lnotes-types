{-# LANGUAGE ExtendedDefaultRules #-}
{-# LANGUAGE OverloadedStrings    #-}
{-# LANGUAGE RecordWildCards      #-}
{-# LANGUAGE ExplicitForAll       #-}
{-# LANGUAGE RankNTypes           #-}
{-# LANGUAGE ScopedTypeVariables  #-}

module LN.T.Pack.Forum where




import           Data.Aeson          (FromJSON, ToJSON (), Value (..), parseJSON, toJSON, object, (.=), (.:))
import           Data.Text           (Text)
import qualified Data.Text           as T
import           Data.Monoid         ((<>))
import           Haskell.Api.Helpers (QueryParam, qp)

newtype ForumPackResponse = ForumPackResponse {
  forumPackResponseForum :: ForumResponse,
  forumPackResponseForumId :: Int64,
  forumPackResponseStat :: ForumStatResponse,
  forumPackResponseLike :: (Maybe LikeResponse),
  forumPackResponseStar :: (Maybe StarResponse),
  forumPackResponseWithOrganization :: (Maybe OrganizationResponse),
  forumPackResponsePermissions :: Permissions
}


instance FromJSON ForumPackResponse where
  parseJSON (Object o) = do
    forumPackResponseForum <- o .: ("forum" :: Text)
    forumPackResponseForumId <- o .: ("forum_id" :: Text)
    forumPackResponseStat <- o .: ("stat" :: Text)
    forumPackResponseLike <- o .: ("like" :: Text)
    forumPackResponseStar <- o .: ("star" :: Text)
    forumPackResponseWithOrganization <- o .: ("with_organization" :: Text)
    forumPackResponsePermissions <- o .: ("permissions" :: Text)
    pure $ ForumPackResponse {
      forumPackResponseForum = forumPackResponseForum,
      forumPackResponseForumId = forumPackResponseForumId,
      forumPackResponseStat = forumPackResponseStat,
      forumPackResponseLike = forumPackResponseLike,
      forumPackResponseStar = forumPackResponseStar,
      forumPackResponseWithOrganization = forumPackResponseWithOrganization,
      forumPackResponsePermissions = forumPackResponsePermissions
    }
  parseJSON x = fail $ "Could not parse object: " <> show x


instance ToJSON ForumPackResponse where
  toJSON ForumPackResponse{..} = object $
    [ "tag" .= ("ForumPackResponse" :: Text)
    , "forum" .= forumPackResponseForum
    , "forum_id" .= forumPackResponseForumId
    , "stat" .= forumPackResponseStat
    , "like" .= forumPackResponseLike
    , "star" .= forumPackResponseStar
    , "with_organization" .= forumPackResponseWithOrganization
    , "permissions" .= forumPackResponsePermissions
    ]


instance Eq ForumPackResponse where
  (==) a b = forumPackResponseForum a == forumPackResponseForum b && forumPackResponseForumId a == forumPackResponseForumId b && forumPackResponseStat a == forumPackResponseStat b && forumPackResponseLike a == forumPackResponseLike b && forumPackResponseStar a == forumPackResponseStar b && forumPackResponseWithOrganization a == forumPackResponseWithOrganization b && forumPackResponsePermissions a == forumPackResponsePermissions b

instance Show ForumPackResponse where
    show rec = "forumPackResponseForum: " <> show (forumPackResponseForum rec) <> ", " <> "forumPackResponseForumId: " <> show (forumPackResponseForumId rec) <> ", " <> "forumPackResponseStat: " <> show (forumPackResponseStat rec) <> ", " <> "forumPackResponseLike: " <> show (forumPackResponseLike rec) <> ", " <> "forumPackResponseStar: " <> show (forumPackResponseStar rec) <> ", " <> "forumPackResponseWithOrganization: " <> show (forumPackResponseWithOrganization rec) <> ", " <> "forumPackResponsePermissions: " <> show (forumPackResponsePermissions rec)

newtype ForumPackResponses = ForumPackResponses {
  forumPackResponses :: [ForumPackResponse]
}


instance FromJSON ForumPackResponses where
  parseJSON (Object o) = do
    forumPackResponses <- o .: ("forum_pack_responses" :: Text)
    pure $ ForumPackResponses {
      forumPackResponses = forumPackResponses
    }
  parseJSON x = fail $ "Could not parse object: " <> show x


instance ToJSON ForumPackResponses where
  toJSON ForumPackResponses{..} = object $
    [ "tag" .= ("ForumPackResponses" :: Text)
    , "forum_pack_responses" .= forumPackResponses
    ]


instance Eq ForumPackResponses where
  (==) a b = forumPackResponses a == forumPackResponses b

instance Show ForumPackResponses where
    show rec = "forumPackResponses: " <> show (forumPackResponses rec)
-- footer