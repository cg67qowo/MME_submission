# MME_submission

This repository contains the data and the code for a paper submitted to the MME workshop, taking place at EACL 2026.

The repository is structured as follows:

- data: this folder contains the data used for this paper. It is divided into:
    - cleaned_FrenchPolArg: This is the post-processed version of the debates scraped for FrenchPolArg.
    - data_for_training: This repository contains the data used for the various experiments. All the data is in CONLL format, with token-level annotations. The data comes from EN-ElecDeb60to20, FR-ElecDeb60to20, and FrenchPolArg (specifically its manually annotated sample).
    - FrenchPolArg_speeches, containing the further material collected for FrenchPolArg. As mentioned in the paper, this material was not yet used for our research, because we focused on conversational data to make the results comparable to ElecDeb60to20, which is composed by debates.
    - translated_elecdeb: This repository contains the translation of ElecDeb60to20 into French and its backtranslation into English, before completion of the projection pipeline. The annotation projection does not have a dedicated folder, because it corresponds to the training data and can be seen in the data_for_training folder.

- component_detection: the code used to test the mentioned models on the component extraction task.

- translation_and_projection: the code used to translated ElecDeb60to20 and project the annotations.

- preprocessing: code for the various preprocessing steps. Not all the steps are reported here, as the paper does not focus on dataset building.

As explained in the paper, this work partly reuses already existent works. In particular, the folder translation_and_projection comes from [this repository by R. Agerri](https://github.com/ragerri/abstrct-projections/tree/main/cross-lingual-argument-mining), which refers to the paper [Cross-Lingual Argument Mining in the Medical Domain (Yeginbergen and Agerri, 2024)](https://arxiv.org/abs/2301.10527), and component_detection comes from [this repository by Goffredo](https://github.com/pierpaologoffredo/PoliticalDebates_AM/tree/main). Component_detection was modified to include different architectures and setups tested in this paper, but keeps Goffredo's structure and implementation. **translation_and_projection was taken as is, and the only differences are related to adaptation to my data.** For these reasons, I reported the original licenses in the folders.

This code is being submitted here for transparency, and before an eventual publication of the code I will make sure that the authors are properly cited in each file. To preserve anonimity, I did not upload the bash files I used to run the code on the cluster.