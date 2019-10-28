import 'package:cached_network_image/cached_network_image.dart';
import 'package:easyhome/components/Navbar/navbar.dart';
import 'package:easyhome/components/footer.dart';
import 'package:easyhome/components/forward_button.dart';
import 'package:easyhome/components/input_form.dart';
import 'package:easyhome/components/payments_card.dart';
import 'package:easyhome/screens/LastPass/last_pass.dart';
import 'package:easyhome/services/size_config.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import 'components/credit_card.dart';
import 'components/paypal_button.dart';

class PaymentPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            Positioned(
              top: SizeConfig.horizontal * 22,
              left: 0,
              right: 0,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: SizeConfig.horizontal * 2,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    ForwardButton(
                      label: 'Indietro',
                      reverse: false,
                      onTap: () => Navigator.pop(context),
                    ),
                    ForwardButton(
                      label: 'Avanti',
                      reverse: true,
                      onTap: () {
                        Navigator.push(
                            context,
                            PageTransition(
                                child: LastPass(),
                                type: PageTransitionType.fade));
                      },
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: SizeConfig.horizontal * 32),
              child: ListView(
                children: <Widget>[
                  PaymentsCard(
                    title: 'Pagamento',
                  ),
                  SizedBox(
                    height: SizeConfig.horizontal * 15,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: SizeConfig.horizontal * 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          '1. Dati di fatturazione',
                          style: TextStyle(
                            color: Color(0xFF707070),
                            fontWeight: FontWeight.bold,
                            fontSize: SizeConfig.horizontal * 4.5,
                          ),
                        ),
                        SizedBox(
                          height: SizeConfig.horizontal * 8,
                        ),
                        InputForm(
                          label: 'Nome',
                          textInputType: TextInputType.text,
                        ),
                        InputForm(
                          label: 'Cognome',
                          textInputType: TextInputType.text,
                        ),
                        InputForm(
                          label: 'Indirizzo',
                          textInputType: TextInputType.text,
                        ),
                        InputForm(
                          label: 'Città',
                          textInputType: TextInputType.text,
                        ),
                        InputForm(
                          label: 'Provincia',
                          textInputType: TextInputType.text,
                        ),
                        InputForm(
                          label: 'CAP',
                          textInputType: TextInputType.number,
                        ),
                        InputForm(
                          label: 'Paese',
                          textInputType: TextInputType.text,
                        ),
                        InputForm(
                          label: 'Cellulare',
                          textInputType: TextInputType.phone,
                        ),
                        SizedBox(
                          height: SizeConfig.horizontal * 15,
                        ),
                        Text(
                          '1. Dati di fatturazione',
                          style: TextStyle(
                            color: Color(0xFF707070),
                            fontWeight: FontWeight.bold,
                            fontSize: SizeConfig.horizontal * 4.5,
                          ),
                        ),
                        SizedBox(
                          height: SizeConfig.horizontal * 8,
                        ),
                        InputForm(
                          label: 'Numero di carta',
                          textInputType: TextInputType.number,
                        ),
                        InputForm(
                          label: 'Intestatario',
                          textInputType: TextInputType.text,
                        ),
                        InputForm(
                          label: 'Data di scadenza',
                          textInputType: TextInputType.datetime,
                        ),
                        InputForm(
                          label: 'CVV',
                          textInputType: TextInputType.number,
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(
                              vertical: SizeConfig.horizontal * 10),
                          child: Column(
                            children: <Widget>[
                              Text(
                                'Oppure, paga con: ',
                                style: TextStyle(
                                    color: Color(0xFF999999),
                                    fontSize: SizeConfig.horizontal * 3.2),
                              ),
                              SizedBox(
                                height: SizeConfig.horizontal * 7,
                              ),
                              PaypalButton(),
                              SizedBox(
                                height: SizeConfig.horizontal * 2,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  CreditCard(
                                    cardUrl:
                                        'https://blockchainwelt.de/wp-content/uploads/2018/12/visa-logo.png',
                                  ),
                                  CreditCard(
                                    cardUrl:
                                        'https://thumbor.forbes.com/thumbor/960x0/https%3A%2F%2Fblogs-images.forbes.com%2Fsteveolenski%2Ffiles%2F2016%2F07%2FMastercard_new_logo-1200x865.jpg',
                                  ),
                                  CreditCard(
                                    cardUrl:
                                        'https://images.fastcompany.net/image/upload/w_596,c_limit,q_auto:best,f_auto/wp-cms/uploads/2018/04/4-you-might-not-notice-amex-new-brand.jpg',
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: SizeConfig.horizontal * 3,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    'Con tecnologia  ',
                                    style: TextStyle(
                                      fontSize: SizeConfig.horizontal * 2.9,
                                    ),
                                  ),
                                  Container(
                                    height: SizeConfig.horizontal * 3,
                                    child: CachedNetworkImage(
                                      imageUrl:
                                          'https://nerdenterprises.com/wp-content/uploads/2018/12/PayPal-Logo.png',
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: SizeConfig.horizontal * 5),
                          child: Footer(),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Navbar(
              context: context,
              color: Theme.of(context).accentColor,
            ),
          ],
        ),
      ),
    );
  }
}
