Elm.ElmStuff = Elm.ElmStuff || {};
Elm.ElmStuff.make = function (elm)
                    {
                      elm.ElmStuff = elm.ElmStuff || {};
                      if (elm.ElmStuff.values)
                      return elm.ElmStuff.values;
                      var N = Elm.Native,
                          _N = N.Utils.make(elm),
                          _L = N.List.make(elm),
                          _E = N.Error.make(elm),
                          _J = N.JavaScript.make(elm),
                          $moduleName = "ElmStuff";
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
                      var _op = {};
                      var main = A3(Graphics.Element.container,
                                    280,
                                    280,
                                    Graphics.Element.middle)(Text.asText("Hello from inside a <div>!"));
                      elm.ElmStuff.values = {_op: _op, main: main};
                      return elm.ElmStuff.values;
                    };