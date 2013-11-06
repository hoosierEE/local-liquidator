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
                      var scene = F2(function (arg1,locs)
                                     {
                                       return function ()
                                              {
                                                switch (arg1.ctor)
                                                {case
                                                 "_Tuple2" :
                                                   return function ()
                                                          {
                                                            var drawPentagon = function (arg0)
                                                                               {
                                                                                 return function ()
                                                                                        {
                                                                                          switch (arg0.ctor)
                                                                                          {case
                                                                                           "_Tuple2" :
                                                                                             return Graphics.Collage.rotate(Basics.toFloat(arg0._0))(Graphics.Collage.move({ctor: "_Tuple2", _0: Basics.toFloat(arg0._0) - Basics.toFloat(arg1._0) / 2, _1: Basics.toFloat(arg1._1) / 2 - Basics.toFloat(arg0._1)})(Graphics.Collage.filled(A4(Color.hsva,
                                                                                                                                                                                                                                                                                                                                               Basics.toFloat(arg0._0),
                                                                                                                                                                                                                                                                                                                                               1,
                                                                                                                                                                                                                                                                                                                                               1,
                                                                                                                                                                                                                                                                                                                                               0.7))(A2(Graphics.Collage.ngon,
                                                                                                                                                                                                                                                                                                                                                        5,
                                                                                                                                                                                                                                                                                                                                                        20))));}
                                                                                          _E.Case($moduleName,
                                                                                                  "between lines 22 and 24");
                                                                                        }();
                                                                               };
                                                            return Graphics.Element.layers(_J.toList([A3(Graphics.Collage.collage,
                                                                                                         arg1._0,
                                                                                                         arg1._1,
                                                                                                         A2(List.map,
                                                                                                            drawPentagon,
                                                                                                            locs)),
                                                                                                      Text.plainText("Click to stamp a pentagon.")]));
                                                          }();}
                                                _E.Case($moduleName,"between lines 21 and 26");
                                              }();
                                     });
                      var resets = Signal.constant(JavaScript.fromInt(42));
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
                      var main = A3(Signal.lift2,scene,Window.dimensions,clickLocations);
                      var stampCount = A2(Signal.lift,
                                          function ($)
                                          {
                                            return JavaScript.fromInt(List.length($));
                                          },
                                          clickLocations);
                      A2(Signal.lift,
                         function (v)
                         {
                           var e = document.createEvent("Event");
                           e.initEvent("count_" + elm.id,true,true);
                           e.value = v;
                           document.dispatchEvent(e);
                           return v;
                         },
                         stampCount);
                      elm.ElmStuff.values = {_op: _op, events: events, clickLocations: clickLocations, scene: scene, main: main, stampCount: stampCount};
                      return elm.ElmStuff.values;
                    };