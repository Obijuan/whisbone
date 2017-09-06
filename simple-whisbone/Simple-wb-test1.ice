{
  "version": "1.1",
  "package": {
    "name": "",
    "version": "",
    "description": "",
    "author": "",
    "image": ""
  },
  "design": {
    "board": "icezum",
    "graph": {
      "blocks": [
        {
          "id": "643808ae-6d1c-4d26-ab40-345f29d19e5a",
          "type": "basic.input",
          "data": {
            "name": "clk",
            "pins": [
              {
                "index": "0",
                "name": "CLK",
                "value": "21"
              }
            ],
            "virtual": false,
            "clock": false
          },
          "position": {
            "x": 120,
            "y": -40
          }
        },
        {
          "id": "07c2bddd-2b6b-480a-a331-3aebeee79baa",
          "type": "basic.input",
          "data": {
            "name": "Button",
            "pins": [
              {
                "index": "0",
                "name": "SW1",
                "value": "10"
              }
            ],
            "virtual": false,
            "clock": false
          },
          "position": {
            "x": 80,
            "y": 152
          }
        },
        {
          "id": "d0411b85-5c60-417a-a20b-d5f9bd825e72",
          "type": "basic.output",
          "data": {
            "name": "LED",
            "pins": [
              {
                "index": "0",
                "name": "LED1",
                "value": "96"
              }
            ],
            "virtual": false
          },
          "position": {
            "x": 872,
            "y": 152
          }
        },
        {
          "id": "5777f386-2305-4431-ba7b-fd8515ffb698",
          "type": "basic.output",
          "data": {
            "name": "LED",
            "pins": [
              {
                "index": "0",
                "name": "LED0",
                "value": "95"
              }
            ],
            "virtual": false
          },
          "position": {
            "x": 872,
            "y": 232
          }
        },
        {
          "id": "88f8e7e0-0da2-4181-afbc-6938c258e6ca",
          "type": "basic.input",
          "data": {
            "name": "Button",
            "pins": [
              {
                "index": "0",
                "name": "SW2",
                "value": "11"
              }
            ],
            "virtual": false,
            "clock": false
          },
          "position": {
            "x": 80,
            "y": 232
          }
        },
        {
          "id": "6eada2ef-a164-4545-8531-5b7f560cb6ac",
          "type": "basic.output",
          "data": {
            "name": "LED",
            "pins": [
              {
                "index": "0",
                "name": "LED7",
                "value": "104"
              }
            ],
            "virtual": false
          },
          "position": {
            "x": 872,
            "y": 312
          }
        },
        {
          "id": "8c73a4ba-1a25-462f-b283-a94f004d3101",
          "type": "basic.input",
          "data": {
            "name": "ADDR",
            "pins": [
              {
                "index": "0",
                "name": "D13",
                "value": "144"
              }
            ],
            "virtual": false,
            "clock": false
          },
          "position": {
            "x": 80,
            "y": 320
          }
        },
        {
          "id": "80c2beb3-6b91-4de3-b392-2746f451a989",
          "type": "basic.input",
          "data": {
            "name": "DATA",
            "pins": [
              {
                "index": "0",
                "name": "D12",
                "value": "143"
              }
            ],
            "virtual": false,
            "clock": false
          },
          "position": {
            "x": 80,
            "y": 392
          }
        },
        {
          "id": "bcca1c1b-3400-4d42-8489-4cb904887757",
          "type": "basic.output",
          "data": {
            "name": "LED",
            "pins": [
              {
                "index": "0",
                "name": "LED6",
                "value": "102"
              }
            ],
            "virtual": false
          },
          "position": {
            "x": 880,
            "y": 392
          }
        },
        {
          "id": "90774496-d34a-4bb2-b7df-68fffc21dee7",
          "type": "basic.code",
          "data": {
            "code": "reg led1 = 0;\nreg led0 = 0;\n\nalways @(posedge i_clk)\n  if ((i_wb_stb) && (i_wb_we) && !o_wb_stall)\n  begin\n    case (i_wb_addr)\n      1'b0: led0 <= i_wb_data;\n      1'b1: led1 <= i_wb_data;\n      default: begin end\n    endcase\n  end\n  \n assign o_wb_stall = 1'b0;\n \n \n assign l1 = led1;\n assign l0 = led0;\n \n always @(posedge i_clk)\n   case (i_wb_addr)\n     1'b0: o_wb_data <= led0;\n     1'b1: o_wb_data <= led1;\n     default: begin end\n   endcase\n \n always @(posedge i_clk)\n\to_wb_ack <= ((i_wb_stb)&&(!o_wb_stall));\n \n ",
            "params": [],
            "ports": {
              "in": [
                {
                  "name": "i_clk"
                },
                {
                  "name": "i_wb_stb"
                },
                {
                  "name": "i_wb_we"
                },
                {
                  "name": "i_wb_addr"
                },
                {
                  "name": "i_wb_data"
                }
              ],
              "out": [
                {
                  "name": "o_wb_stall"
                },
                {
                  "name": "l1"
                },
                {
                  "name": "l0"
                },
                {
                  "name": "o_wb_data"
                },
                {
                  "name": "o_wb_ack"
                }
              ]
            }
          },
          "position": {
            "x": 408,
            "y": 64
          },
          "size": {
            "width": 384,
            "height": 400
          }
        }
      ],
      "wires": [
        {
          "source": {
            "block": "90774496-d34a-4bb2-b7df-68fffc21dee7",
            "port": "l0"
          },
          "target": {
            "block": "5777f386-2305-4431-ba7b-fd8515ffb698",
            "port": "in"
          }
        },
        {
          "source": {
            "block": "643808ae-6d1c-4d26-ab40-345f29d19e5a",
            "port": "out"
          },
          "target": {
            "block": "90774496-d34a-4bb2-b7df-68fffc21dee7",
            "port": "i_clk"
          },
          "vertices": [
            {
              "x": 272,
              "y": 64
            }
          ]
        },
        {
          "source": {
            "block": "07c2bddd-2b6b-480a-a331-3aebeee79baa",
            "port": "out"
          },
          "target": {
            "block": "90774496-d34a-4bb2-b7df-68fffc21dee7",
            "port": "i_wb_stb"
          }
        },
        {
          "source": {
            "block": "88f8e7e0-0da2-4181-afbc-6938c258e6ca",
            "port": "out"
          },
          "target": {
            "block": "90774496-d34a-4bb2-b7df-68fffc21dee7",
            "port": "i_wb_we"
          }
        },
        {
          "source": {
            "block": "8c73a4ba-1a25-462f-b283-a94f004d3101",
            "port": "out"
          },
          "target": {
            "block": "90774496-d34a-4bb2-b7df-68fffc21dee7",
            "port": "i_wb_addr"
          },
          "vertices": []
        },
        {
          "source": {
            "block": "80c2beb3-6b91-4de3-b392-2746f451a989",
            "port": "out"
          },
          "target": {
            "block": "90774496-d34a-4bb2-b7df-68fffc21dee7",
            "port": "i_wb_data"
          },
          "vertices": []
        },
        {
          "source": {
            "block": "90774496-d34a-4bb2-b7df-68fffc21dee7",
            "port": "l1"
          },
          "target": {
            "block": "d0411b85-5c60-417a-a20b-d5f9bd825e72",
            "port": "in"
          }
        },
        {
          "source": {
            "block": "90774496-d34a-4bb2-b7df-68fffc21dee7",
            "port": "o_wb_data"
          },
          "target": {
            "block": "6eada2ef-a164-4545-8531-5b7f560cb6ac",
            "port": "in"
          }
        },
        {
          "source": {
            "block": "90774496-d34a-4bb2-b7df-68fffc21dee7",
            "port": "o_wb_ack"
          },
          "target": {
            "block": "bcca1c1b-3400-4d42-8489-4cb904887757",
            "port": "in"
          }
        }
      ]
    },
    "state": {
      "pan": {
        "x": 81.1328,
        "y": 189.5
      },
      "zoom": 1
    }
  },
  "dependencies": {}
}