{-# LANGUAGE ExtendedDefaultRules #-}
{-# LANGUAGE OverloadedStrings    #-}
{-# LANGUAGE RecordWildCards      #-}
{-# LANGUAGE ExplicitForAll       #-}
{-# LANGUAGE RankNTypes           #-}
{-# LANGUAGE ScopedTypeVariables  #-}

module LN.T.Pack.Resource where




import           Data.Aeson          (FromJSON, ToJSON (), Value (..), parseJSON, toJSON, object, (.=), (.:))
import           Data.Text           (Text)
import qualified Data.Text           as T
import           Data.Monoid         ((<>))
import           Haskell.Api.Helpers (QueryParam, qp)

newtype ResourcePackResponse = ResourcePackResponse {
  resourcePackResponseResource :: ResourceResponse,
  resourcePackResponseResourceId :: Int64,
  resourcePackResponseUser :: UserSanitizedResponse,
  resourcePackResponseUserId :: Int64,
  resourcePackResponseStat :: ResourceStatResponse,
  resourcePackResponseLike :: (Maybe LikeResponse),
  resourcePackResponseStar :: (Maybe StarResponse),
  resourcePackResponsePermissions :: Permissions
}


instance FromJSON ResourcePackResponse where
  parseJSON (Object o) = do
    resourcePackResponseResource <- o .: ("resource" :: Text)
    resourcePackResponseResourceId <- o .: ("resource_id" :: Text)
    resourcePackResponseUser <- o .: ("user" :: Text)
    resourcePackResponseUserId <- o .: ("user_id" :: Text)
    resourcePackResponseStat <- o .: ("stat" :: Text)
    resourcePackResponseLike <- o .: ("like" :: Text)
    resourcePackResponseStar <- o .: ("star" :: Text)
    resourcePackResponsePermissions <- o .: ("permissions" :: Text)
    pure $ ResourcePackResponse {
      resourcePackResponseResource = resourcePackResponseResource,
      resourcePackResponseResourceId = resourcePackResponseResourceId,
      resourcePackResponseUser = resourcePackResponseUser,
      resourcePackResponseUserId = resourcePackResponseUserId,
      resourcePackResponseStat = resourcePackResponseStat,
      resourcePackResponseLike = resourcePackResponseLike,
      resourcePackResponseStar = resourcePackResponseStar,
      resourcePackResponsePermissions = resourcePackResponsePermissions
    }
  parseJSON x = fail $ "Could not parse object: " <> show x


instance ToJSON ResourcePackResponse where
  toJSON ResourcePackResponse{..} = object $
    [ "tag" .= ("ResourcePackResponse" :: Text)
    , "resource" .= resourcePackResponseResource
    , "resource_id" .= resourcePackResponseResourceId
    , "user" .= resourcePackResponseUser
    , "user_id" .= resourcePackResponseUserId
    , "stat" .= resourcePackResponseStat
    , "like" .= resourcePackResponseLike
    , "star" .= resourcePackResponseStar
    , "permissions" .= resourcePackResponsePermissions
    ]


instance Eq ResourcePackResponse where
  (==) a b = resourcePackResponseResource a == resourcePackResponseResource b && resourcePackResponseResourceId a == resourcePackResponseResourceId b && resourcePackResponseUser a == resourcePackResponseUser b && resourcePackResponseUserId a == resourcePackResponseUserId b && resourcePackResponseStat a == resourcePackResponseStat b && resourcePackResponseLike a == resourcePackResponseLike b && resourcePackResponseStar a == resourcePackResponseStar b && resourcePackResponsePermissions a == resourcePackResponsePermissions b

instance Show ResourcePackResponse where
    show rec = "resourcePackResponseResource: " <> show (resourcePackResponseResource rec) <> ", " <> "resourcePackResponseResourceId: " <> show (resourcePackResponseResourceId rec) <> ", " <> "resourcePackResponseUser: " <> show (resourcePackResponseUser rec) <> ", " <> "resourcePackResponseUserId: " <> show (resourcePackResponseUserId rec) <> ", " <> "resourcePackResponseStat: " <> show (resourcePackResponseStat rec) <> ", " <> "resourcePackResponseLike: " <> show (resourcePackResponseLike rec) <> ", " <> "resourcePackResponseStar: " <> show (resourcePackResponseStar rec) <> ", " <> "resourcePackResponsePermissions: " <> show (resourcePackResponsePermissions rec)

newtype ResourcePackResponses = ResourcePackResponses {
  resourcePackResponses :: [ResourcePackResponse]
}


instance FromJSON ResourcePackResponses where
  parseJSON (Object o) = do
    resourcePackResponses <- o .: ("resource_pack_responses" :: Text)
    pure $ ResourcePackResponses {
      resourcePackResponses = resourcePackResponses
    }
  parseJSON x = fail $ "Could not parse object: " <> show x


instance ToJSON ResourcePackResponses where
  toJSON ResourcePackResponses{..} = object $
    [ "tag" .= ("ResourcePackResponses" :: Text)
    , "resource_pack_responses" .= resourcePackResponses
    ]


instance Eq ResourcePackResponses where
  (==) a b = resourcePackResponses a == resourcePackResponses b

instance Show ResourcePackResponses where
    show rec = "resourcePackResponses: " <> show (resourcePackResponses rec)
-- footer