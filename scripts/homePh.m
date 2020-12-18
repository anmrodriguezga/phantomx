function homePh(pub, data, home)
    data(1).Data = home(1);
    data(2).Data = home(2);
    data(3).Data = home(3);
    data(4).Data = home(4);

    send(pub(1), data(1));
    send(pub(2), data(2));
    send(pub(3), data(3));
    send(pub(4), data(4));