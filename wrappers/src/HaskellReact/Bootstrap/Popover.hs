{-# LANGUAGE PackageImports #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RebindableSyntax #-}
{-# LANGUAGE NoImplicitPrelude #-}

module HaskellReact.Bootstrap.Popover (
  PopoverProps ,
  placementRight, placementLeft, placementBottom, placementTop, 
  popover ,
  mkPopoverProps ) where

import HaskellReact
import HaskellReact.Bootstrap (reactBootstrap)
import FFI (ffi, Automatic, Defined(Undefined), Nullable(Null))
import "fay-base" Data.Text (fromString, Text)
import HaskellReact.Event (SyntheticMouseEvent)
import "fay-base" Prelude

data PopoverProps = PopoverProps {
  placement :: Text ,
  positionLeft :: Int ,
  positionTop :: Int }

newtype Placement = Placement { getPlacement :: Text }

placementRight :: Placement
placementRight = Placement "right"

placementLeft :: Placement
placementLeft = Placement "left"

placementBottom :: Placement
placementBottom = Placement "bottom"

placementTop :: Placement
placementTop = Placement "top"

mkPopoverProps :: Placement 
               -> Int -- ^ left
               -> Int -- ^ top
               -> PopoverProps
mkPopoverProps placement = PopoverProps (getPlacement placement)

popover :: Renderable a
        => PopoverProps
        -> a
        -> ReactInstance
popover popoverProps = reactBootstrap "Popover" popoverProps
