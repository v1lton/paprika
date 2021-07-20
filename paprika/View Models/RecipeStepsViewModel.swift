//
//  RecipeStepsViewModel.swift
//  paprika
//
//  Created by Wilton Ramos on 17/07/21.
//

import SwiftUI

extension RecipeStepsView {
    class ViewModel: ObservableObject {
        @Published var recipeSteps = [
            ["Passo 1", "Numa tigela pequena misture o fermento e o açúcar com ¼ de xícara (chá) do leite morno até dissolver. Deixe descansar por cerca de 5 minutos, até começar a espumar."],
            ["Passo 2", "Numa tigela grande, misture a farinha com o sal. Acrescente a batata-doce e misture bem. Abra um buraco no centro e junte o fermento dissolvido. Numa tigela pequena quebre 1 ovo e então junte aos ingredientes – se ele estiver estragado você não perde a receita. Misture com uma espátula, do centro para a borda, para incorporar. Acrescente o restante do leite morno aos poucos, misturando bem com a mão."],
            ["Passo 3", "Assim que a farinha tiver absorvido os líquidos, junte a manteiga e amasse bem – parece que não vai dar certo, a manteiga demora para ser absorvida pela massa, mas é assim mesmo, continue amassando. Aperte, amasse, estique e amasse novamente até ficar com a textura macia e úmida – marque 10 minutos no relógio! Se preferir, sove a massa na bancada ou na batedeira com o gancho."],
            ["Passo 4", "Modele uma bola, volte a massa para a tigela e cubra com um pano de prato. Deixe descansar por 1 hora em temperatura ambiente, ou até dobrar de tamanho."],
            ["Passo 5", "Unte com manteiga uma assadeira grande de cerca de 30 cm x 40 cm (se preferir, utilize uma assadeira antiaderente)."],
            ["Passo 6", "Assim que tiver crescido, transfira a massa para a bancada e modele os pães: corte a massa em 10 porções e enrole cada uma no tamanho de bolas de tênis; transfira para a assadeira untada, deixando espaço entre cada um para crescer e achate levemente a superfície – isso serve para que os pães cresçam de maneira mais uniforme. Cubra com o pano de prato e deixe crescer por mais 40 minutos."],
            ["Passo 7", "Quando faltar 20 minutos para dar o tempo de crescimento do pão, preaqueça o forno a 200 °C (temperatura média)."],
            ["Passo 8", "Numa tigela pequena, quebre o outro ovo. Junte 2 colheres (chá) de água e misture bem com um garfo. Com um pincel, passe a mistura de ovo batido sobre os pães."],
            ["Passo 9", "Leve os pães ao forno para assar por cerca de 30 minutos, até crescer e dourar. Retire do forno e, com cuidado, desenforme sobre uma grelha – se permanecerem na fôrma ou sobre uma superfície lisa podem acumular vapor e amolecer. Deixe esfriar antes de servir."]
        ]
    }
}
