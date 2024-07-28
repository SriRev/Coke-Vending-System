# Coke Vending Machine - Verilog Implementation

## Overview

This project implements a simple Coke vending machine system using Verilog. The vending machine accepts coins, dispenses Coke when sufficient money is inserted, and provides change if necessary.

## Features

- Accepts ₹1 coins
- Dispenses Coke when the price is met
- Returns change for overpayment
- Resets after each transaction

## Module Description

The main module `coke_vending_machine` has the following ports:

- Inputs:
  - `clk`: Clock signal
  - `reset`: Reset signal
  - `coin_inserted`: Signal indicating a coin has been inserted

- Outputs:
  - `dispense_coke`: Signal to dispense a Coke
  - `change[1:0]`: 2-bit output indicating the amount of change to return
  - `current_amount[1:0]`: 2-bit output showing the current amount inserted

## State Machine

The vending machine operates using a simple state machine with three states:

1. IDLE: Waiting for coins
2. ACCEPTING: Accepting coins and checking if enough money is inserted
3. DISPENSING: Dispensing Coke and returning change

## Parameters

- `COKE_PRICE`: Set to 2 (representing $2)
- `MAX_AMOUNT`: Set to 3 (maximum amount the machine can handle)

## Usage

1. Include this module in your Verilog project
2. Instantiate the module in your top-level design
3. Connect the necessary inputs and outputs
4. Simulate or synthesize the design

## Simulation

To test this module, create a testbench that:

1. Applies clock and reset signals
2. Simulates coin insertions
3. Monitors the outputs for correct behavior
