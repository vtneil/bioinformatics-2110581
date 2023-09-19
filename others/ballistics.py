def p_barlow(strength, d_o, thick):
    return (2 * thick * strength) / (d_o)


def p_lame(strength, d_o, thick):
    d_i = d_o - 2 * thick
    return strength * (d_o ** 2 - d_i ** 2) / (d_o ** 2 + d_i ** 2)


def p_asme(strength, d_o, thick, efficiency = 1):
    return (2 * thick * strength * efficiency) / (d_o - 0.8 * thick)


if __name__ == '__main__':
    MPA_PSI = 145.0377
    Fty = 241
    Ftu = 290
    OD = 6 * 25.4
    t = 10
    
    print(f'Barlow Design: {MPA_PSI * p_barlow(Fty, OD, t)} psi')
    print(f'Barlow Burst:  {MPA_PSI * p_barlow(Ftu, OD, t)} psi')
    
    print(f'Lame Design:   {MPA_PSI * p_lame(Fty, OD, t)} psi')
    print(f'Lame Burst:    {MPA_PSI * p_lame(Ftu, OD, t)} psi')
    
    print(f'ASME Design:   {MPA_PSI * p_asme(Fty, OD, t)} psi')
    print(f'ASME Burst:    {MPA_PSI * p_asme(Ftu, OD, t)} psi')
    