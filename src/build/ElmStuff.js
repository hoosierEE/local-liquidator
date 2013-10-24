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
                      var JavaScript = Elm.JavaScript.make(elm);
                      var Window = Elm.Window.make(elm);
                      var Mouse = Elm.Mouse.make(elm);
                      var resets = Signal.constant(JavaScript.fromInt(42));
                      document.addEventListener("reset_" + elm.id,
                                                function (e)
                                                {
                                                  elm.notify(resets.id,e.value);
                                                });
                      var _op = {};
                      var resets = Signal.constant(JavaScript.fromInt(42));
                      var main = Graphics.Element.color(Color.green)(A3(Graphics.Element.container,
                                                                        280,
                                                                        280,
                                                                        Graphics.Element.middle)(Text.asText("Hello from inside a <div>!")));
                      var events = A2(Signal.merge,
                                      A2(Signal._op["<~"],
                                         Maybe.Just,
                                         A2(Signal.sampleOn,Mouse.clicks,Mouse.position)),
                                      A2(Signal.sampleOn,resets,Signal.constant(Maybe.Nothing)));
                      var clickLocations = function ()
                                           {
                                             var update = F2(function (event,locations)
                                                             {
                                                               return function ()
                                                                      {
                                                                        switch (event.ctor)
                                                                        {case
                                                                         "Just" :
                                                                           return {ctor: "::", _0: event._0, _1: locations};
                                                                         case
                                                                         "Nothing" :
                                                                           return _J.toList([]);}
                                                                        _E.Case($moduleName,
                                                                                "between lines 15 and 18");
                                                                      }();
                                                             });
                                             return A3(Signal.foldp,update,_J.toList([]),events);
                                           }();
                      elm.ElmStuff.values = {_op: _op, events: events, clickLocations: clickLocations, main: main};
                      return elm.ElmStuff.values;
                    };