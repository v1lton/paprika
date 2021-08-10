//
//  Colors.swift
//  paprika
//
//  Created by iris on 24/07/21.
//

import SwiftUI

extension Color{
    public static let primitiveBlack: Color = Color("PrimitiveBlack")
    public static let primitive700:   Color = Color(#colorLiteral(red: 0.20000000298023224, green: 0.1921568661928177, blue: 0.1882352977991104, alpha: 1))
    public static let primitive600:   Color = Color("Primitive600")
    public static let primitive500:   Color = Color(#colorLiteral(red: 0.44999998807907104, green: 0.4398749768733978, blue: 0.4364999830722809, alpha: 1))
    public static let primitive400:   Color = Color("Primitive400")
    public static let primitive300:   Color = Color(#colorLiteral(red: 0.800000011920929, green: 0.7880000472068787, blue: 0.784000039100647, alpha: 1))
    public static let primitive200:   Color = Color("Primitive200")
    public static let primitive100:   Color = Color("Primitive100")
    public static let primitive50:    Color = Color("Primitive50")
    public static let primitiveWhite: Color = Color("PrimitiveWhite")
    
    public static let brandPrimary800: Color = Color(#colorLiteral(red: 0.25, green: 0.025000005960464478, blue: 0.0662500187754631, alpha: 1))
    public static let brandPrimary700: Color = Color(#colorLiteral(red: 0.3499999940395355, green: 0.052499979734420776, blue: 0.10704167187213898, alpha: 1))
    public static let brandPrimary600: Color = Color(#colorLiteral(red: 0.44999998807907104, green: 0.08999994397163391, blue: 0.15599997341632843, alpha: 1))
    public static let brandPrimary500: Color = Color(#colorLiteral(red: 0.550000011920929, green: 0.13750004768371582, blue: 0.2131250649690628, alpha: 1))
    public static let brandPrimary400: Color = Color("Brand Primary400")
    public static let brandPrimary300: Color = Color(#colorLiteral(red: 0.800000011920929, green: 0.3199999928474426, blue: 0.40800002217292786, alpha: 1))
    public static let brandPrimary200: Color = Color(#colorLiteral(red: 0.8500000238418579, green: 0.4675000309944153, blue: 0.5376250743865967, alpha: 1))
    public static let brandPrimary100: Color = Color(#colorLiteral(red: 0.8999999761581421, green: 0.6299999952316284, blue: 0.6794999837875366, alpha: 1))
    public static let brandPrimary50:  Color = Color("Brand Primary50")
    
    public static let brandSecondary800: Color = Color(#colorLiteral(red: 0.4000000059604645, green: 0.10233335196971893, blue: 0.02000001072883606, alpha: 1))
    public static let brandSecondary700: Color = Color(#colorLiteral(red: 0.5, green: 0.14750002324581146, blue: 0.050000011920928955, alpha: 1))
    public static let brandSecondary600: Color = Color(#colorLiteral(red: 0.6000000238418579, green: 0.2005000114440918, blue: 0.0899999737739563, alpha: 1))
    public static let brandSecondary500: Color = Color(#colorLiteral(red: 0.699999988079071, green: 0.2613333463668823, blue: 0.13999998569488525, alpha: 1))
    public static let brandSecondary400: Color = Color("Brand Secondary400")
    public static let brandSecondary300: Color = Color(#colorLiteral(red: 0.8500000238418579, green: 0.4505000114440918, blue: 0.3399999737739563, alpha: 1))
    public static let brandSecondary200: Color = Color(#colorLiteral(red: 0.8899999856948853, green: 0.5762749910354614, blue: 0.4895000159740448, alpha: 1))
    public static let brandSecondary100: Color = Color(#colorLiteral(red: 0.9300000667572021, green: 0.7114500403404236, blue: 0.6510000228881836, alpha: 1))
    public static let brandSecondary50:  Color = Color(#colorLiteral(red: 0.9800000190734863, green: 0.8648499846458435, blue: 0.8330000042915344, alpha: 1))
    
    public static let negativeFeedback800: Color = Color(#colorLiteral(red: 0.44999998807907104, green: 0.004500001668930054, blue: 0.004500001668930054, alpha: 1))
    public static let negativeFeedback700: Color = Color("Negative Feedback700")
    public static let negativeFeedback600: Color = Color(#colorLiteral(red: 0.6499999761581421, green: 0.06499999761581421, blue: 0.06499999761581421, alpha: 1))
    public static let negativeFeedback500: Color = Color(#colorLiteral(red: 0.75, green: 0.11249995231628418, blue: 0.11249995231628418, alpha: 1))
    public static let negativeFeedback400: Color = Color(#colorLiteral(red: 0.8500000238418579, green: 0.17000001668930054, blue: 0.17000001668930054, alpha: 1))
    public static let negativeFeedback300: Color = Color(#colorLiteral(red: 0.8799999952316284, green: 0.30800002813339233, blue: 0.30800002813339233, alpha: 1))
    public static let negativeFeedback200: Color = Color(#colorLiteral(red: 0.9200000166893005, green: 0.46000000834465027, blue: 0.46000000834465027, alpha: 1))
    public static let negativeFeedback100: Color = Color(#colorLiteral(red: 0.9599999785423279, green: 0.671999990940094, blue: 0.671999990940094, alpha: 1))
    public static let negativeFeedback50:  Color = Color("Negative Feedback50")
    
    public static let positiveFeedback800: Color = Color("Positive Feedback800")
    public static let positiveFeedback700: Color = Color(#colorLiteral(red: 0.10666662454605103, green: 0.4000000059604645, blue: 0.07999998331069946, alpha: 1))
    public static let positiveFeedback600: Color = Color(#colorLiteral(red: 0.1333332359790802, green: 0.5, blue: 0.09999993443489075, alpha: 1))
    public static let positiveFeedback500: Color = Color(#colorLiteral(red: 0.2149999737739563, green: 0.6000000238418579, blue: 0.18000000715255737, alpha: 1))
    public static let positiveFeedback400: Color = Color(#colorLiteral(red: 0.31499993801116943, green: 0.699999988079071, blue: 0.2799999713897705, alpha: 1))
    public static let positiveFeedback300: Color = Color(#colorLiteral(red: 0.39666661620140076, green: 0.800000011920929, blue: 0.35999998450279236, alpha: 1))
    public static let positiveFeedback200: Color = Color(#colorLiteral(red: 0.5275980234146118, green: 0.8980392217636108, blue: 0.49392157793045044, alpha: 1))
    public static let positiveFeedback100: Color = Color(#colorLiteral(red: 0.7758333086967468, green: 0.949999988079071, blue: 0.7599999904632568, alpha: 1))
    public static let positiveFeedback50:  Color = Color("Positive Feedback50")
    
    public static let alertFeedback800: Color = Color(#colorLiteral(red: 0.5, green: 0.3762499988079071, blue: 0.004999995231628418, alpha: 1))
    public static let alertFeedback700: Color = Color("Alert Feedback700")
    public static let alertFeedback600: Color = Color(#colorLiteral(red: 0.699999988079071, green: 0.5354999899864197, blue: 0.041999995708465576, alpha: 1))
    public static let alertFeedback500: Color = Color(#colorLiteral(red: 0.800000011920929, green: 0.6159999966621399, blue: 0.06400001049041748, alpha: 1))
    public static let alertFeedback400: Color = Color(#colorLiteral(red: 0.9200000166893005, green: 0.7084000110626221, blue: 0.07359999418258667, alpha: 1))
    public static let alertFeedback300: Color = Color(#colorLiteral(red: 0.9399999976158142, green: 0.7754999995231628, blue: 0.28200000524520874, alpha: 1))
    public static let alertFeedback200: Color = Color(#colorLiteral(red: 0.9599999785423279, green: 0.8279999494552612, blue: 0.43199998140335083, alpha: 1))
    public static let alertFeedback100: Color = Color(#colorLiteral(red: 0.9599999785423279, green: 0.8999999761581421, blue: 0.7199999690055847, alpha: 1))
    public static let alertFeedback50:  Color = Color("Alert Feedback50")
}
