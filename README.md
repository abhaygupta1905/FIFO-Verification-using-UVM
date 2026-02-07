# FIFO Verification using UVM (SystemVerilog)

## 📌 Overview
This project demonstrates the **design and verification of a synchronous FIFO** using **SystemVerilog and UVM (Universal Verification Methodology)**.  
The objective is to verify correct FIFO functionality such as **data integrity, ordering, full/empty behavior, and read/write operations** using a structured UVM-based testbench.


---

## 🧠 FIFO Design Specification

### Design Features
- Synchronous FIFO
- First-In First-Out data ordering
- Separate read and write pointers
- Full and Empty flag generation
- Active-high reset

### Interface Signals
| Signal | Direction | Width | Description |
|------|---------|------|------------|
| `clock` | Input | 1 | System clock |
| `reset` | Input | 1 | Active-high reset |
| `data_in` | Input | 8 | Data input |
| `wn` | Input | 1 | Write enable |
| `rn` | Input | 1 | Read enable |
| `data_out` | Output | 8 | Data output |
| `full` | Output | 1 | FIFO full indicator |
| `empty` | Output | 1 | FIFO empty indicator |

### FIFO Parameters
- **Depth**: 8 entries  
- **Data Width**: 8 bits  

---

## 🧪 Verification Methodology

The verification environment is implemented using **UVM**, following standard layered testbench architecture.

### UVM Components Used
- **Sequence Item** – Defines read/write transactions
- **Sequence & Sequencer** – Generates stimulus
- **Driver** – Drives signals to DUT
- **Monitor** – Samples DUT interface signals
- **Scoreboard** – Reference model with data checking
- **Coverage** – Functional coverage for commands and data
- **Agent** – Active agent with driver, sequencer, monitor
- **Environment** – Integrates agent and scoreboard
- **Test** – Controls simulation flow

---

## 🏗 Testbench Architecture
TOP
└── TEST
└── ENV
├── AGENT
│ ├── SEQUENCER
│ ├── DRIVER
│ └── MONITOR
└── SCOREBOARD
└── DUT (FIFO)


---

## ✔ Features Verified

- ✔ FIFO write operation
- ✔ FIFO read operation
- ✔ Empty flag assertion
- ✔ Full flag assertion
- ✔ Data order preservation
- ✔ Read/Write sequencing
- ✔ Corner cases using random stimulus

---

## 🧮 Scoreboard & Reference Model

- Uses a **queue-based reference model**
- Stores expected write data
- Compares expected vs actual read data
- Reports **MATCH / NOT MATCH** during simulation

---

## 📊 Functional Coverage

The following coverage points are implemented:

- Data input coverage (`data_in`)
- Write enable (`wn`)
- Read enable (`rn`)
- FIFO empty condition
- FIFO full condition
- Cross coverage between write command and data

Coverage is sampled inside the scoreboard.

---

## Test Scenario

- The base test performs:
- Multiple write operations
- Multiple read operations
- Randomized read/write transactions
- Coverage collection and reporting

---

## Skills Demonstrated

- SystemVerilog RTL design
- UVM architecture & phases
- Transaction-level modeling
- Scoreboard implementation
- Functional coverage
- Debugging & verification flow
