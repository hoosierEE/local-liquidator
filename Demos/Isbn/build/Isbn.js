Elm.Main = Elm.Main || {};
Elm.Main.make = function (elm)
                {
                  elm.Main = elm.Main || {};
                  if (elm.Main.values)
                  return elm.Main.values;
                  var N = Elm.Native,
                      _N = N.Utils.make(elm),
                      _L = N.List.make(elm),
                      _E = N.Error.make(elm),
                      _J = N.JavaScript.make(elm),
                      $moduleName = "Main";
                  var Text = Elm.Text.make(elm);
                  var Text = Elm.Text.make(elm);
                  var Basics = Elm.Basics.make(elm);
                  var Signal = Elm.Signal.make(elm);
                  var List = Elm.List.make(elm);
                  var Maybe = Elm.Maybe.make(elm);
                  var Time = Elm.Time.make(elm);
                  var Prelude = Elm.Prelude.make(elm);
                  var Graphics = Graphics || {};
                  Graphics.Element = Elm.Graphics.Element.make(elm);
                  var Color = Elm.Color.make(elm);
                  var Graphics = Graphics || {};
                  Graphics.Collage = Elm.Graphics.Collage.make(elm);
                  var Char = Elm.Char.make(elm);
                  var String = Elm.String.make(elm);
                  var Maybe = Elm.Maybe.make(elm);
                  var Http = Elm.Http.make(elm);
                  var Graphics = Graphics || {};
                  Graphics.Input = Elm.Graphics.Input.make(elm);
                  var _op = {};
                  var toUrl = function (s)
                              {
                                return Maybe.Just(s);
                              };
                  var display = function (response)
                                {
                                  return function ()
                                         {
                                           switch (response.ctor)
                                           {case
                                            "Failure" :
                                              return Text.asText(response);
                                            case
                                            "Success" :
                                              return Text.text(Text.monospace(Text.toText(response._0)));
                                            case
                                            "Waiting" :
                                              return A3(Graphics.Element.fittedImage,
                                                        100,
                                                        100,
                                                        "/shells.jpg");}
                                           _E.Case($moduleName,"between lines 25 and 28");
                                         }();
                                };
                  var $ = Graphics.Input.field("ISBN number"),
                      field = $._0,
                      rawInput = $._1;
                  var realInput = A2(Signal.lift,toUrl,rawInput);
                  var responses = Http.sendGet(A2(Signal.lift,
                                                  A2(Maybe.maybe,"",Basics.id),
                                                  realInput));
                  var message = function ()
                                {
                                  var msg = Text.plainText("Enter the ISBN (10 or 13) of the book you wish to display.");
                                  var output = F2(function (inp,rsp)
                                                  {
                                                    return A3(Maybe.maybe,
                                                              msg,
                                                              function (arg0)
                                                              {
                                                                return function ()
                                                                       {
                                                                         return display(rsp);
                                                                       }();
                                                              },
                                                              inp);
                                                  });
                                  return A3(Signal.lift2,output,realInput,responses);
                                }();
                  var main = A3(Signal.lift2,Graphics.Element.above,field,message);
                  elm.Main.values = {_op: _op, field: field, rawInput: rawInput, toUrl: toUrl, realInput: realInput, responses: responses, display: display, message: message, main: main};
                  return elm.Main.values;
                };