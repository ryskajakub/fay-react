{-# LANGUAGE PackageImports #-}
{-# LANGUAGE RebindableSyntax #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE NoImplicitPrelude #-}

module HaskellReact.Bootstrap.Input (
  mkInputProps
  , InputProps(..)
  , input
  , textarea
) where

import "fay-base" Prelude
import "fay-base" Data.Text (Text, fromString)
import FFI (Defined(Undefined, Defined), Nullable(Null))
import HaskellReact
import HaskellReact.Bootstrap
import "fay-base" Unsafe.Coerce (unsafeCoerce)

data InputProps = InputProps {
  type_ :: Text
  , defaultValue :: Defined Text
  , onChange :: Defined (SyntheticEvent -> Fay ())
  , placeholder :: Text
  , label_ :: Defined Text
  , labelClassName :: Defined Text
  , wrapperClassName :: Defined Text
  , disabled :: Defined Bool
  , addonBefore :: Defined DOMElement
  , addonAfter :: Defined DOMElement
  , buttonBefor :: Defined DOMElement
  , buttonAfter :: Defined DOMElement
}

mkInputProps :: InputProps
mkInputProps = InputProps "text" Undefined Undefined "" Undefined Undefined Undefined
  Undefined Undefined Undefined Undefined Undefined

input :: InputProps -> DOMElement
input inputProps = inputInternal inputProps ([]::[DOMElement])

inputInternal :: (Renderable a) => InputProps -> a -> DOMElement
inputInternal inputProps children = 
  reactInstance2DOM $ reactBootstrap "Input" inputProps children

textarea :: InputProps -> DOMElement
textarea inputProps = let
  body = case defaultValue inputProps of
    Defined text -> text
    Undefined -> ""
  inputProps' = inputProps {
    type_ = "textarea" ,
    defaultValue = Undefined }
  in inputInternal inputProps' body