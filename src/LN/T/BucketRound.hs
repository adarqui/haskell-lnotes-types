{-# LANGUAGE BangPatterns         #-}
{-# LANGUAGE DeriveGeneric        #-}
{-# LANGUAGE DeriveAnyClass       #-}
{-# LANGUAGE ExtendedDefaultRules #-}
{-# LANGUAGE OverloadedStrings    #-}
{-# LANGUAGE RecordWildCards      #-}
{-# LANGUAGE ExplicitForAll       #-}
{-# LANGUAGE RankNTypes           #-}
{-# LANGUAGE ScopedTypeVariables  #-}

module LN.T.BucketRound where


import LN.T.Training


import           Control.DeepSeq             (NFData)
import           Data.Aeson                  (FromJSON, ToJSON (), Value (..), parseJSON, toJSON, object, (.=), (.:))
import           Data.Default                (Default, def)
import           Data.Int                    (Int64)
import           Data.Text                   (Text)
import qualified Data.Text                   as T
import           Data.Time                   (UTCTime)
import           Data.Typeable               (Typeable)
import           Data.Monoid                 ((<>))
import           GHC.Generics                (Generic)
import           Haskell.Api.Helpers.Shared  (QueryParam, qp)
import           Prelude

data BucketRoundRequest = BucketRoundRequest {
  bucketRoundRequestTrainingStyles :: !([TrainingStyle]),
  bucketRoundRequestThreshold :: !(Int64),
  bucketRoundRequestTimeLimit :: !(Int64),
  bucketRoundRequestGuard :: !(Int)
}  deriving (Generic,Typeable,NFData)


instance FromJSON BucketRoundRequest where
  parseJSON (Object o) = do
    bucketRoundRequestTrainingStyles <- o .: ("training_styles" :: Text)
    bucketRoundRequestThreshold <- o .: ("threshold" :: Text)
    bucketRoundRequestTimeLimit <- o .: ("time_limit" :: Text)
    bucketRoundRequestGuard <- o .: ("guard" :: Text)
    pure $ BucketRoundRequest {
      bucketRoundRequestTrainingStyles = bucketRoundRequestTrainingStyles,
      bucketRoundRequestThreshold = bucketRoundRequestThreshold,
      bucketRoundRequestTimeLimit = bucketRoundRequestTimeLimit,
      bucketRoundRequestGuard = bucketRoundRequestGuard
    }
  parseJSON x = fail $ "Could not parse object: " <> show x


instance ToJSON BucketRoundRequest where
  toJSON BucketRoundRequest{..} = object $
    [ "tag" .= ("BucketRoundRequest" :: Text)
    , "training_styles" .= bucketRoundRequestTrainingStyles
    , "threshold" .= bucketRoundRequestThreshold
    , "time_limit" .= bucketRoundRequestTimeLimit
    , "guard" .= bucketRoundRequestGuard
    ]


instance Eq BucketRoundRequest where
  (==) a b = bucketRoundRequestTrainingStyles a == bucketRoundRequestTrainingStyles b && bucketRoundRequestThreshold a == bucketRoundRequestThreshold b && bucketRoundRequestTimeLimit a == bucketRoundRequestTimeLimit b && bucketRoundRequestGuard a == bucketRoundRequestGuard b

instance Show BucketRoundRequest where
    show rec = "bucketRoundRequestTrainingStyles: " <> show (bucketRoundRequestTrainingStyles rec) <> ", " <> "bucketRoundRequestThreshold: " <> show (bucketRoundRequestThreshold rec) <> ", " <> "bucketRoundRequestTimeLimit: " <> show (bucketRoundRequestTimeLimit rec) <> ", " <> "bucketRoundRequestGuard: " <> show (bucketRoundRequestGuard rec)

data BucketRoundResponse = BucketRoundResponse {
  bucketRoundResponseId :: !(Int64),
  bucketRoundResponseUserId :: !(Int64),
  bucketRoundResponseBucketId :: !(Int64),
  bucketRoundResponseTrainingStyles :: !([TrainingStyle]),
  bucketRoundResponseThreshold :: !(Int64),
  bucketRoundResponseTimeLimit :: !(Int64),
  bucketRoundResponseTrainingNode :: !(TrainingNode),
  bucketRoundResponseActive :: !(Bool),
  bucketRoundResponseGuard :: !(Int),
  bucketRoundResponseCreatedAt :: !((Maybe UTCTime)),
  bucketRoundResponseModifiedAt :: !((Maybe UTCTime)),
  bucketRoundResponseActivityAt :: !((Maybe UTCTime))
}  deriving (Generic,Typeable,NFData)


instance FromJSON BucketRoundResponse where
  parseJSON (Object o) = do
    bucketRoundResponseId <- o .: ("id" :: Text)
    bucketRoundResponseUserId <- o .: ("user_id" :: Text)
    bucketRoundResponseBucketId <- o .: ("bucket_id" :: Text)
    bucketRoundResponseTrainingStyles <- o .: ("training_styles" :: Text)
    bucketRoundResponseThreshold <- o .: ("threshold" :: Text)
    bucketRoundResponseTimeLimit <- o .: ("time_limit" :: Text)
    bucketRoundResponseTrainingNode <- o .: ("training_node" :: Text)
    bucketRoundResponseActive <- o .: ("active" :: Text)
    bucketRoundResponseGuard <- o .: ("guard" :: Text)
    bucketRoundResponseCreatedAt <- o .: ("created_at" :: Text)
    bucketRoundResponseModifiedAt <- o .: ("modified_at" :: Text)
    bucketRoundResponseActivityAt <- o .: ("activity_at" :: Text)
    pure $ BucketRoundResponse {
      bucketRoundResponseId = bucketRoundResponseId,
      bucketRoundResponseUserId = bucketRoundResponseUserId,
      bucketRoundResponseBucketId = bucketRoundResponseBucketId,
      bucketRoundResponseTrainingStyles = bucketRoundResponseTrainingStyles,
      bucketRoundResponseThreshold = bucketRoundResponseThreshold,
      bucketRoundResponseTimeLimit = bucketRoundResponseTimeLimit,
      bucketRoundResponseTrainingNode = bucketRoundResponseTrainingNode,
      bucketRoundResponseActive = bucketRoundResponseActive,
      bucketRoundResponseGuard = bucketRoundResponseGuard,
      bucketRoundResponseCreatedAt = bucketRoundResponseCreatedAt,
      bucketRoundResponseModifiedAt = bucketRoundResponseModifiedAt,
      bucketRoundResponseActivityAt = bucketRoundResponseActivityAt
    }
  parseJSON x = fail $ "Could not parse object: " <> show x


instance ToJSON BucketRoundResponse where
  toJSON BucketRoundResponse{..} = object $
    [ "tag" .= ("BucketRoundResponse" :: Text)
    , "id" .= bucketRoundResponseId
    , "user_id" .= bucketRoundResponseUserId
    , "bucket_id" .= bucketRoundResponseBucketId
    , "training_styles" .= bucketRoundResponseTrainingStyles
    , "threshold" .= bucketRoundResponseThreshold
    , "time_limit" .= bucketRoundResponseTimeLimit
    , "training_node" .= bucketRoundResponseTrainingNode
    , "active" .= bucketRoundResponseActive
    , "guard" .= bucketRoundResponseGuard
    , "created_at" .= bucketRoundResponseCreatedAt
    , "modified_at" .= bucketRoundResponseModifiedAt
    , "activity_at" .= bucketRoundResponseActivityAt
    ]


instance Eq BucketRoundResponse where
  (==) a b = bucketRoundResponseId a == bucketRoundResponseId b && bucketRoundResponseUserId a == bucketRoundResponseUserId b && bucketRoundResponseBucketId a == bucketRoundResponseBucketId b && bucketRoundResponseTrainingStyles a == bucketRoundResponseTrainingStyles b && bucketRoundResponseThreshold a == bucketRoundResponseThreshold b && bucketRoundResponseTimeLimit a == bucketRoundResponseTimeLimit b && bucketRoundResponseTrainingNode a == bucketRoundResponseTrainingNode b && bucketRoundResponseActive a == bucketRoundResponseActive b && bucketRoundResponseGuard a == bucketRoundResponseGuard b && bucketRoundResponseCreatedAt a == bucketRoundResponseCreatedAt b && bucketRoundResponseModifiedAt a == bucketRoundResponseModifiedAt b && bucketRoundResponseActivityAt a == bucketRoundResponseActivityAt b

instance Show BucketRoundResponse where
    show rec = "bucketRoundResponseId: " <> show (bucketRoundResponseId rec) <> ", " <> "bucketRoundResponseUserId: " <> show (bucketRoundResponseUserId rec) <> ", " <> "bucketRoundResponseBucketId: " <> show (bucketRoundResponseBucketId rec) <> ", " <> "bucketRoundResponseTrainingStyles: " <> show (bucketRoundResponseTrainingStyles rec) <> ", " <> "bucketRoundResponseThreshold: " <> show (bucketRoundResponseThreshold rec) <> ", " <> "bucketRoundResponseTimeLimit: " <> show (bucketRoundResponseTimeLimit rec) <> ", " <> "bucketRoundResponseTrainingNode: " <> show (bucketRoundResponseTrainingNode rec) <> ", " <> "bucketRoundResponseActive: " <> show (bucketRoundResponseActive rec) <> ", " <> "bucketRoundResponseGuard: " <> show (bucketRoundResponseGuard rec) <> ", " <> "bucketRoundResponseCreatedAt: " <> show (bucketRoundResponseCreatedAt rec) <> ", " <> "bucketRoundResponseModifiedAt: " <> show (bucketRoundResponseModifiedAt rec) <> ", " <> "bucketRoundResponseActivityAt: " <> show (bucketRoundResponseActivityAt rec)

data BucketRoundResponses = BucketRoundResponses {
  bucketRoundResponses :: !([BucketRoundResponse])
}  deriving (Generic,Typeable,NFData)


instance FromJSON BucketRoundResponses where
  parseJSON (Object o) = do
    bucketRoundResponses <- o .: ("bucket_round_responses" :: Text)
    pure $ BucketRoundResponses {
      bucketRoundResponses = bucketRoundResponses
    }
  parseJSON x = fail $ "Could not parse object: " <> show x


instance ToJSON BucketRoundResponses where
  toJSON BucketRoundResponses{..} = object $
    [ "tag" .= ("BucketRoundResponses" :: Text)
    , "bucket_round_responses" .= bucketRoundResponses
    ]


instance Eq BucketRoundResponses where
  (==) a b = bucketRoundResponses a == bucketRoundResponses b

instance Show BucketRoundResponses where
    show rec = "bucketRoundResponses: " <> show (bucketRoundResponses rec)
-- footer