# PUCCH-FORMAT-0 (5G NR) — FPGA Receiver Project

This repository contains an FPGA-oriented implementation of **5G NR PUCCH Format 0 (PUCCH0) receiver processing**, organized as modular IP blocks (Vivado IP / RTL submodules).

The goal of this repo is to make it easy to:
- understand the **PUCCH0 receiver pipeline**,
- locate each **IP block** in the design,
- trace the **dataflow** and **interfaces** between blocks.

---

## 1) Documentation (start here)

### System-level documents
- **`fpga_full_system.pdf`**  
  High-level MAC–PHY–DFE–RF architecture.

- **`pucch_format_0.pdf`**  
  PUCCH0 receiver block diagram exported from Vivado.

### Recommended reading order
1. `fpga_full_system.pdf`
2. `pucch_format_0.pdf`
3. Then browse each IP folder (in the pipeline order below).

---

## 2) Repository Layout

At the repository root you will find:
- `fpga_full_system.pdf` — full system overview
- `pucch_format_0.pdf` — PUCCH0 pipeline in Vivado
- `README.md` — this file
- `pucch0/` — top-level PUCCH0 design (Vivado project / integration directory)
- Individual IP folders — each folder corresponds to one IP used in `pucch0/`

### IP block folders (pipeline order)
- `physical_control/` — trigger and symbol control  
- `frame_sync/` — frame/slot/symbol timing synchronization  
- `ofdm_demodulation/` — OFDM demodulation output for PUCCH processing  
- `layer2_parameter/` — parses/holds parameters (from FAPI/config)  
- `resoure_demapping/` — resource extraction/demapping  
- `rx_duplication/` — duplicates resources for multiple candidates  
- `cyclic_shift_gen/` — cyclic/pseudo sequence generation  
- `sync_cyclic/` — aligns cyclic sequences across symbols  
- `correlation/` — correlation and metric generation  
- `combine_rx_sym/` — combines metrics across RX and symbols  
- `peak_search/` — peak detection and ACK decision  

### Additional folders
- `all_sub_ips/` — shared sub-IPs used by multiple blocks

---

## Contact
If you have questions about the design or want to reuse/extend the blocks, please open an issue or contact me at **nvhuynh107@gmail.com**.
