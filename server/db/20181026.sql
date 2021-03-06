PGDMP                     	    v            ddjhmesoifbor7     10.5 (Ubuntu 10.5-1.pgdg14.04+1)    10.3 &               0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                       false                       1262    16801    ddjhmesoifbor7    DATABASE     �   CREATE DATABASE "ddjhmesoifbor7" WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'en_US.UTF-8' LC_CTYPE = 'en_US.UTF-8';
     DROP DATABASE "ddjhmesoifbor7";
             rhdqrapnzwfrkl    false                        2615    408131    public    SCHEMA        CREATE SCHEMA "public";
    DROP SCHEMA "public";
             rhdqrapnzwfrkl    false                        3079    13941    plpgsql 	   EXTENSION     C   CREATE EXTENSION IF NOT EXISTS "plpgsql" WITH SCHEMA "pg_catalog";
    DROP EXTENSION "plpgsql";
                  false                       0    0    EXTENSION "plpgsql"    COMMENT     B   COMMENT ON EXTENSION "plpgsql" IS 'PL/pgSQL procedural language';
                       false    1            �            1259    409905 
   ArtistTags    TABLE     �   CREATE TABLE "public"."ArtistTags" (
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "artistId" integer NOT NULL,
    "tagId" integer NOT NULL
);
 "   DROP TABLE "public"."ArtistTags";
       public         rhdqrapnzwfrkl    false    3            �            1259    410010    Artists    TABLE     �  CREATE TABLE "public"."Artists" (
    "id" integer NOT NULL,
    "name" character varying(255),
    "email" character varying(255),
    "lat" numeric,
    "lng" numeric,
    "insta" character varying(255),
    "region" character varying(255),
    "followers" character varying(255),
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);
    DROP TABLE "public"."Artists";
       public         rhdqrapnzwfrkl    false    3            �            1259    410061    Artists_id_seq    SEQUENCE     {   CREATE SEQUENCE "public"."Artists_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE "public"."Artists_id_seq";
       public       rhdqrapnzwfrkl    false    3    197                       0    0    Artists_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE "public"."Artists_id_seq" OWNED BY "public"."Artists"."id";
            public       rhdqrapnzwfrkl    false    198            �            1259    410108 	   Favorites    TABLE     �   CREATE TABLE "public"."Favorites" (
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "artistId" integer NOT NULL,
    "userId" integer NOT NULL
);
 !   DROP TABLE "public"."Favorites";
       public         rhdqrapnzwfrkl    false    3            �            1259    410128    Tags    TABLE     �   CREATE TABLE "public"."Tags" (
    "id" integer NOT NULL,
    "name" character varying(255),
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);
    DROP TABLE "public"."Tags";
       public         rhdqrapnzwfrkl    false    3            �            1259    410142    Tags_id_seq    SEQUENCE     x   CREATE SEQUENCE "public"."Tags_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE "public"."Tags_id_seq";
       public       rhdqrapnzwfrkl    false    200    3                       0    0    Tags_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE "public"."Tags_id_seq" OWNED BY "public"."Tags"."id";
            public       rhdqrapnzwfrkl    false    201            �            1259    410180    Users    TABLE     ;  CREATE TABLE "public"."Users" (
    "id" integer NOT NULL,
    "email" character varying(255),
    "username" character varying(255),
    "password" character varying(255),
    "lat" numeric,
    "lng" numeric,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);
    DROP TABLE "public"."Users";
       public         rhdqrapnzwfrkl    false    3            �            1259    410217    Users_id_seq    SEQUENCE     y   CREATE SEQUENCE "public"."Users_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE "public"."Users_id_seq";
       public       rhdqrapnzwfrkl    false    3    202                       0    0    Users_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE "public"."Users_id_seq" OWNED BY "public"."Users"."id";
            public       rhdqrapnzwfrkl    false    203            |           2604    410261 
   Artists id    DEFAULT     v   ALTER TABLE ONLY "public"."Artists" ALTER COLUMN "id" SET DEFAULT "nextval"('"public"."Artists_id_seq"'::"regclass");
 ?   ALTER TABLE "public"."Artists" ALTER COLUMN "id" DROP DEFAULT;
       public       rhdqrapnzwfrkl    false    198    197            }           2604    410277    Tags id    DEFAULT     p   ALTER TABLE ONLY "public"."Tags" ALTER COLUMN "id" SET DEFAULT "nextval"('"public"."Tags_id_seq"'::"regclass");
 <   ALTER TABLE "public"."Tags" ALTER COLUMN "id" DROP DEFAULT;
       public       rhdqrapnzwfrkl    false    201    200            ~           2604    410295    Users id    DEFAULT     r   ALTER TABLE ONLY "public"."Users" ALTER COLUMN "id" SET DEFAULT "nextval"('"public"."Users_id_seq"'::"regclass");
 =   ALTER TABLE "public"."Users" ALTER COLUMN "id" DROP DEFAULT;
       public       rhdqrapnzwfrkl    false    203    202                      0    409905 
   ArtistTags 
   TABLE DATA               W   COPY "public"."ArtistTags" ("createdAt", "updatedAt", "artistId", "tagId") FROM stdin;
    public       rhdqrapnzwfrkl    false    196                      0    410010    Artists 
   TABLE DATA               �   COPY "public"."Artists" ("id", "name", "email", "lat", "lng", "insta", "region", "followers", "createdAt", "updatedAt") FROM stdin;
    public       rhdqrapnzwfrkl    false    197            	          0    410108 	   Favorites 
   TABLE DATA               W   COPY "public"."Favorites" ("createdAt", "updatedAt", "artistId", "userId") FROM stdin;
    public       rhdqrapnzwfrkl    false    199            
          0    410128    Tags 
   TABLE DATA               J   COPY "public"."Tags" ("id", "name", "createdAt", "updatedAt") FROM stdin;
    public       rhdqrapnzwfrkl    false    200                      0    410180    Users 
   TABLE DATA               r   COPY "public"."Users" ("id", "email", "username", "password", "lat", "lng", "createdAt", "updatedAt") FROM stdin;
    public       rhdqrapnzwfrkl    false    202                       0    0    Artists_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('"public"."Artists_id_seq"', 166, true);
            public       rhdqrapnzwfrkl    false    198                       0    0    Tags_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('"public"."Tags_id_seq"', 66, true);
            public       rhdqrapnzwfrkl    false    201                       0    0    Users_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('"public"."Users_id_seq"', 1, true);
            public       rhdqrapnzwfrkl    false    203            �           2606    410503    ArtistTags ArtistTags_pkey 
   CONSTRAINT     o   ALTER TABLE ONLY "public"."ArtistTags"
    ADD CONSTRAINT "ArtistTags_pkey" PRIMARY KEY ("artistId", "tagId");
 J   ALTER TABLE ONLY "public"."ArtistTags" DROP CONSTRAINT "ArtistTags_pkey";
       public         rhdqrapnzwfrkl    false    196    196            �           2606    410517    Artists Artists_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY "public"."Artists"
    ADD CONSTRAINT "Artists_pkey" PRIMARY KEY ("id");
 D   ALTER TABLE ONLY "public"."Artists" DROP CONSTRAINT "Artists_pkey";
       public         rhdqrapnzwfrkl    false    197            �           2606    410519    Favorites Favorites_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY "public"."Favorites"
    ADD CONSTRAINT "Favorites_pkey" PRIMARY KEY ("artistId", "userId");
 H   ALTER TABLE ONLY "public"."Favorites" DROP CONSTRAINT "Favorites_pkey";
       public         rhdqrapnzwfrkl    false    199    199            �           2606    410521    Tags Tags_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY "public"."Tags"
    ADD CONSTRAINT "Tags_pkey" PRIMARY KEY ("id");
 >   ALTER TABLE ONLY "public"."Tags" DROP CONSTRAINT "Tags_pkey";
       public         rhdqrapnzwfrkl    false    200            �           2606    410523    Users Users_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY "public"."Users"
    ADD CONSTRAINT "Users_pkey" PRIMARY KEY ("id");
 @   ALTER TABLE ONLY "public"."Users" DROP CONSTRAINT "Users_pkey";
       public         rhdqrapnzwfrkl    false    202            �           2606    410524 #   ArtistTags ArtistTags_artistId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "public"."ArtistTags"
    ADD CONSTRAINT "ArtistTags_artistId_fkey" FOREIGN KEY ("artistId") REFERENCES "public"."Artists"("id") ON UPDATE CASCADE ON DELETE CASCADE;
 S   ALTER TABLE ONLY "public"."ArtistTags" DROP CONSTRAINT "ArtistTags_artistId_fkey";
       public       rhdqrapnzwfrkl    false    197    3714    196            �           2606    410529     ArtistTags ArtistTags_tagId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "public"."ArtistTags"
    ADD CONSTRAINT "ArtistTags_tagId_fkey" FOREIGN KEY ("tagId") REFERENCES "public"."Tags"("id") ON UPDATE CASCADE ON DELETE CASCADE;
 P   ALTER TABLE ONLY "public"."ArtistTags" DROP CONSTRAINT "ArtistTags_tagId_fkey";
       public       rhdqrapnzwfrkl    false    3718    196    200            �           2606    410534 !   Favorites Favorites_artistId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "public"."Favorites"
    ADD CONSTRAINT "Favorites_artistId_fkey" FOREIGN KEY ("artistId") REFERENCES "public"."Artists"("id") ON UPDATE CASCADE ON DELETE CASCADE;
 Q   ALTER TABLE ONLY "public"."Favorites" DROP CONSTRAINT "Favorites_artistId_fkey";
       public       rhdqrapnzwfrkl    false    197    3714    199            �           2606    410539    Favorites Favorites_userId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "public"."Favorites"
    ADD CONSTRAINT "Favorites_userId_fkey" FOREIGN KEY ("userId") REFERENCES "public"."Users"("id") ON UPDATE CASCADE ON DELETE CASCADE;
 O   ALTER TABLE ONLY "public"."Favorites" DROP CONSTRAINT "Favorites_userId_fkey";
       public       rhdqrapnzwfrkl    false    202    199    3720               �  x���Kr%)E�ϫ�yG$����:��6�R�$³���#!�y)R��7�/�K��R�b|���^����K��,����l�Iz>D���R�+�)��C�nP�������ʯ$�-�/�;K�ۅ��gS�l�8��7�ԍK�K8Ժ'$m�d�vI���%f��+�+� �m��*�-�#u�eeo�[im�E5Ĵ�9K-��>g���*��H6V](��6�^Y/*A��H����anA�m�I�W��]D�)�(Z�_Ţe��FXٌ�K������|d�R�#4Y�\D�մagI�:P`�X�m
@��T�\�]�e��
׵���j�W��bH+� *}�+�!�H���倝��/��]y��tC�,��W=Cю�%�=!@�p���e�e9��­{~(�x�(2N��Eq�G�q�+�F]�s��5E1+�>a���#������D�F�%d�t���z�9��9��K��X�dW~_����y��(奐�ҹ�o��QZ�ى&KʕbhmG.Ҳ���}����h�h��4����*/����n���� ��lJ2��l��-����U�X̣"'��D�⦵�����h�,��/b(P�,��t7o!��H�{�A����q�F�oB��l�Y�Mo�&��c��tR�=�D��	����ii?�g���Վ��H͸:Y��˒��8I�a�W��z�ҷ�k�n���h������i#J:��_���T�䏔�P��4�OzJ1�(�l^6�(�EcB�!)�N֢=��>��V*��N�=g�Z�m�2
_V�uN^F�>���%e�݃�r�l{������Q:�jGj��-p���*��:Pޘ��U6�i(	���EI�Zt���<���;v��,e���N�`����Ն�qY`��EI�rH�f�o8X;TT�P�MU/#*۬k��yȁ�W9�dW9+0T<�.�%������|�E�t�ݵ�\����S͒f���(�������R��ٻ(F����8MJ�0X�e��9KUq�,�^��*��s��I�}ߚ{��0�F�f\х��&j]��Z}v�e����cw�,�hÇ�Mnc_X�(Z���	ͽ�KܶX�bw� 	B�H�pt=�sT���mc5��`�4E5!�cM����FӉa��N���:�5���b��v�8�8x<hA���J���"G�L#�8����_�	�F"�'/m�z�1�>wU�L�ܣe�)\��TM��C����
NV,��H!��JDG�����4&I�)#��qzo�0C���Q�����Ą��#��al�c���ዕ�<��ΞU����PCkk�Q�q.���E1hI/�r��f��)���f�E���a;��_�ԑ�f%J�ݦ�M'�������Vw��}���q,J��87,.�(�N:��6��6m/��]���/��H6�gi&�j����[~�t��O��h5���z��$���ǻA�	�E�V?K*�qZ$J��!&A���gnv~�DI�ڿ�O�e��Eb#Q����S<��A��m�������iJ�i�;O��{��%u�;��+�������+��@�]�����R@�L2E)�r���AO�Rܱ�T����������L��(����	v�h��{��D��B�	+�����q�+��4.x��D���qߣ�6�?��Z���;K��Ǐ`91=v���Q��t�����`5xD�xTQ^$F�Ԯw��$�ߢ�m�Y�$��G���ѯ���Az�Z�e��E*ŴX�igBjQ+՗�ei����K��Xh��M��lY�%C�i�퀕Q���g$.ƫ\(��ga�JO�!��W��&�>
��
��Ϣ_��֪B�I{{��Y1����Lw\$eh����@���N�I`3g%� p��Vl�R��Yw�,U z�&��c{KA�z}/��Yղ:�1d!#�f����'0����y:�/�
��6	�`槠��F"4�`!ǝZ/�7�`VHf�>i��>ٗ�������^�            x��|ے�ƒ�s�+�6�Q�*��n�$��-y[�� It"�R-�{f>`�D�����U ��KGaK@�
����Z�Y0����ɻ�-��]����g��\�,3��*�B[o2�H��t�|ެ�n]�r�aQ6�H�U��b�|Z��c.�I.�7B$�^s�e*��O��>����6ʹ�G?)�~oV����[�WW���m��٬��Y��fŌL���v��Y�?^9�nV�,�s}]��|'⛲���Lg���Ն���Y�ϓ�\�l��*^�������*/�(�J5���.Dj��ވ�g��v���$�_ju�ujT�Q
���䟛�]g+\�.{�z'�r�7N+τ6��L;cㆻ���r�n�2�G�tӭۼ*��Ih.e�燭v{�oڢ�����լj�ݧ'��+ㄧ]�Jhn%�O��IG����裟<��0�X��"�e��x���P\+��Y�E�DT�e+��V�s���z����6��Rq��[D��vcٔɿ�M}}񥬓_�!�L*\f���a0AK�}բ�Z�qzd��f�$q��B\j(t�M8�:�/�TTU޲�O����j�a��͒�j��P�uƻ�k�
�8��*i���Pj�/�L�{+���:����{�k���TZ/��ޓ;ɴ�T�i�̖���:���fMݕ���SX�Q�DdP�K�S�D��Em{����2nX�f���i�'�UJ�*���ߊ���׼&��/I�`S�G�K��m����b=[`���UU�)լ��|�]��O�X�˔�̈́
�LB������ܳ�)����Ă_� ��.9O�<$�5ж1bAzuU0x0�Z���zg�Xm�1�����y=)�y�f�6E�t�Ӳ-:x�����e�C����م�)�#�S#��}l�ɳ���c���i&2����$Q�m�����z�G �H�2.(��%#�J9�~������M��j.ⳋv�}�j�s.fX)��pgТ���'���	���)ҿ^������A�%W���J�k�6��/��V��������w�+��o���Fy)����,��i��ū��:��X/���I��m�ɫ	��,B�~[�U�*'+Y_�;�{���JKV h�9y���LY�[Lx�Xyմ'lN����4�"Χ���q�����m�l�׫pu7/�Ha�F¿aRO��~��D��g`�����~�pRf�ߋk	��Sĝ rFx��������d'Y*�t2�@*<w��-;퀸�u�-��M�YMI��y��s��3G�#A�cpÚ=��oe��,���bGZև��6������f
�z�#�L�C���zs��p�����%Q1I�K>-��C��]��Mx;b�\j��R�.P)vE��~�oe�j�u1ذ�~��ѽ��.��6���Ve�|Q��`-��;w�;Nb���*��l'�UY-��B�;x$xj3d$�Ve�$�/�:��!� 7���=D�R�5�)�~ƹ f�������<5���	N�&lc�Q|W�l�d�˝�b��F>h��"5�0�L���`B��6��EY��M�aMX�Rxgw����U��O h����&9�0r6¿�Kl#�S�¿/Vӆ���5mL@� <G��ɠ`�!bp(���>�2x3K
V$�˚�T�i��.�VXe�9A�������0m�5x��M��ooK�c�V�p$�Y�0���z��8[4`�_������ͻ�{�  �Y�� #@��#E��`�������2 b8��[��5u�̓?`� ���!Б�s��U�!����y�V�I��^�6;�!��ce�h���Q���A��$ ��}7�3Sp2��w��"z�ˁ	���=Op��z��#�!0D�Bֻ�UWz�����Ȁ��H����~��0���o�Y�V��~���q
�Φ �a�o���vZ���7X�ps���i�A�2ެ��I?�d�Qn�J��p|�,��\��سQiق��н*�M���9/2��Y��'|��4�BX�m��G�:>"R���x:~Ea60�u�
� �t�2G�$ �k��@�ī4�h�`����)��b?sf a2��y�J~i�1X��	��Wcp�`]����,��Z;n?����\M��������/���d�K��4�R����]&�[��>�	��	�9E9F��ށ8����d�R��w�.�}��x��O��Z?��|�5�
��?��$,�&3��~�.<�V/y���3O�Z�5��$��!������ ���b�:]����b�����)�BJ�:
hL>	�٫|5ݴ��H^�*���~֎KGxZ4������g$O^4�U�/M�M	ǍR��Fg��;s4�����Y�M�� ��@~$e�1�+8��.��Ě�77U1dk�b�![�eP��#�80�C���!��4K�	�b�Y�V�+�. y߉�8x7�=�`��(��i��
��c��	�������UsM4����"������P��2Vv���j02��9�m�)�S�Jh>:���Kxo��a��.�F�f�q�Wǀ��(�!���ە��4�XYGV�:�<��t�N�[
`����%{V�fy0�'��� >��`]}�����^�mutP��a�7P`���`�-�iS'o�:��.�X��]�Sp�)D�B�#�]��UΏ���2��f�D �/wIJ�F}��uWCO�gy;m�P��S�	8��R�kH�*V���~��fS��ɋʹ�t��Fx���}0�,tX'�I���
���<�.g�lJ<����guY�
��6'\1oEY_ﻂ���iq�[�/���gG����6��ŉ�0*��Q���l����2<�l� �k�j�ǋG((rL��R�uS7sf��m3�B7�>�at&<mp��T�rпa�`���ͦ-� ��?N"���)+���0���� ��þ��-]���L��:"��Ϥ�n�^�*�-P�ٗ������������������P@��P�%�� '�,���
�df��_Q:��	����U&��z ]��giB�\Q^$z6��p%�7��}�J��c�K�`xBIE�D�`��a��Y�]����X����ē$^�N <�'�6>eA���1�qp{�ǜ�M�aܐ� �î�%)a �� ҈X@�"�>�ҟ�ꦄ'8�{sҊ5��{0��s��C��i��e&��?��dB=�����L(V������C��� rqJ~��6����0z�FO��q6��h�#�Lo�����y��	г?ȷ��:yU��l��@��9̤p��iZ?~��hC�<4ȣ�4J���}�a��_�7p�Ks�v3�&��yS�EU�
��,ޜ*��{������E�S��ĮX���:*�ǐ�Adv$�UÞW�f^��x�|
W��`���m�}���$�,>g�8����JǏ��CX�p�t��`!��eS�x�5\/��]�悀�_Z-�<'.@D��������P�aS�x�ײ�n�E�V�B#����D�l�GL�^6�P�f��XP*?�T�XF�sf�ˢZ�ٗ���O�&�`^�E �1Av�=�%���������<?�H���@*���O�_���?=}���O_}��>����M@���I��`�5)xJ�M �����ڏ�(��(��>�A](��FJjN��S}G+��7�;T'�u�0ZDXzL�.$�˗q�%fߔ�!��Ȕ	���ɘ�j\	Ͼb�d�	Cm ,h��V����������ۘ�-�����g�W"����+����m�oV�������� `9�� Z_!�u��GDM8h��Ί^��v��yw�M>6]��t���d`��y=���q�ь��Z"��c���� ^D!Ulf{UVU�7�I�* ,oS�S�V����n�YNl�w@Z��6����~����-��`L�nnq}���OJ����!����0�䴌1�{J�d�y�~�6ۼ��zP��d���p'N�&�rg���qB�Vd�[�"̩��ߒ B  _Kt�%��]k�
@��TL � %PJ��N<W�Rؠ��!��b���\��Z�4㢞�ko�~� �<m)o�Sj<����ms]N�y�eѴק�3�Q��@յ`���٦�;�_�
���iQޜ�[N�u&B�6�+�>�t���QER�.�z��	�t�6�Ѡc��.�Ӽ*�ݽ�Yj{S��(�E�dP�a���ք�����,.N�*M�{*
�}��kĬ�e=�m��C�����)Ԉ:�h��dg\�&<\jfE&���|�>.�߾+�s1���[\����,Vi���P�u��cVp���$t�H�������Vs8�%�������e�_%�c�F�ҋx6�@�\����SG�%~D	�������a�q����4z6>�B E�c�p�|�ܡs��9˞o(?˯c��"�8EН*-�����h̔�<\Γ���:��>]�/�D�>��[��/���2j�V�H`�~J���c̵T5�5�˲AЬK��͚����~��"P5�J�P�]�,��0U���E�?0���G�w+O�Ab�^B��i��i��Hh�LL�{IXR��p�O��q�A?�Q �ϯ!Ty���۴�/ɟyþ�MY/c�W���Dps�dwl�bV�ZO��{s�u^��ރ"QL�f(H��m�En_i	�#Z)����l���@�8���<�0��n��-�3��hq�K!��=l��f=o�w���B�nn���˷^���_qq�,�.�2������p��`!�El�ؘ�ͨ��k9����M��t���ݽN�\��h�}:N�g�����JmO�Z:L�]7��L����P��4ū��.�E�����#�p�Bj@�>�
Ϫ���g�`�h����-бu����YꝪ���0+���.�]d.w��A=�����ZC|�3H�L�	��ٸ�� +e�c�oPv�p+S�J��!(F���r	ᇑ{�6n�g��n�q|�̸��'$�u_�S�MYP��c�x��-����|$��J�����H����%��D5��Å
�@Xsb-�y��M�]&��MC�]�.O.���穞�%E��	��sin��Q�j��>Ң���i]���uS�A//�
J�-�.R�3TR��&�	s��!���ݴ�L���g	ܪ=������F(r0�n����v��~�e��HM�2�*G=-� ��gӌP#S�>	=-�~�EԺ^�U��V�u�"����r��&�ŭ��|}N�Y���`J��S>�����N�붹�Zύ�P�gr�n� �L��J�Qe���_����W�/�p�p�[Q� !Oq;�`]���ϔ�b�f�'����0=���N��v�D� ���=�TP�吻T�1mr�O;:J��=��=�"����$T*|_ٲP~l B���6m���WTG�j7����I(PN���B3jX�(�q��z�a��$ʍ��Z���~�^��i����G �ϏJ�k�iE=Q۾�B?�
e]Ƈcx�}����Ɇ3Y�Ruo�(�z���Ĝeɲ~gi(���6$`t��I���w��<ͤ�B�] ���	{��e�^�$�} ����~��&bOH���R�Oθ�n�q�����n�����>�%E�e�m"����"9"���C�oĈ��{-�`�gs"$}A��OJ�N�j�hGu���̧Z�vS���`�SZ���1��;���ze�x�6��/����y�<J(@P�|�:L�"B�&���.�0��?�A\�g�H��+T?����H����bT�h�붧ӯ'�41��nz�?��9@cG��g(=�-��O���tZɯM�5�7_�����ZL�������[������?����qq3��CӍ���̱?�#�ENd�;����X!l*��6(��c��R�no���svt�HH�Cm��)�c��k�&���p��8�nKU!)�Mt�1��ߋo�Q���$�.	�D�� ��n<�Q�V�����Bٱ9n�x} �U�$�!��7�,����e��=�m5u�h�ͲʞPD|D056��.y7{��YhYHWX�	y�(JJ=I�L�ROp�2�_&�~��ɞ̋H��-�H��"�䰔�M��-
�=���pꞔ���c�R�r��V�,�;i�B�'�
h�qr�l�^�-��N�c�͍��܈��?�z k�8�=�����Jyl���_4?4�y:3��j�C ��e�K�t}���sz/��ཱ}n��9�0��S��#����xZPP�$�fݢ����͋*y�6�c�|UW�^׹���Ey1�ÿ�4-
������p�LH֙S�}�P��;���y�ŗ�{I�!:�Ko�PV4�-��-����ߕ�[9�_���D�M���B���s(/�-�a����R�?d����G*� ��(5���&yZ5uװ���u�����H�7����8��|�U�ܵ���jSo!󧛼T�L�`o�%2;�hl�F=�q��Y�I�c�|~
� @R_�N�Ï���΋ܵSө�=$q��9l�Ӟ�@2uĀ�{M�b�0���&���_��Zo�pux�|,��p����fL�ַgJ�-s?V˻Utd�Y<Ċ}z�i[z�e�q��u���|�>N�wk<P���?&��)watLPH��.y�!�ԟ���:� �r\����Y�ߛnG?oV�T{�̉@�A��Sʏx��~���#]�����؉��tƻ��6�{ؐ\!p��|��zp�6N��س� [;h�Q�Be���\v�(���K*��H ��v�A4	m,�zQ����5�? 4�*��$���ޟt�#�;�Gd���U��	�'#���r�25�U�[~�b��~k�^��n��WQ3'����\�+x�z�eU���s+z}�&�%Y`[6�;z��,�3~_��%,�]3ٙB�p��j	WJYP��_�v�G�j�������
��z��)W�G���	����0�ex�m��Y�̻%kQN[��{`�jˠ#N��2�u��@wS�$[�^g����G���.�,[ ��y�$�s��n;�@�\ʮHI�͑�
i�zM=�m�̷y҄r���\������N""�	�K'��E{�����������yp":8D�Nz+����!&�G]�Q�dl�����+jǡ�/캩�Ķź|�U�	M9/�2#����
���]	��ө�jF��Aw�togh�ʂt�2��C4�}� ��c��O(AJb5HP�=����gr5��Ylj��h\���rwR�|F�qq�$��\�����F"W���b��Zٱ�Tv�!�}dt��#�}uJ ��R9S�6ۇ񜵢��	��-wo���M���6��Wtq��)/����[���Z�t��ն&��=�L�x�߾[8�_#B���o�mh.e3�����g�p*��#�tL���@Θ(��9mLDG�-m<��#�.y��A�4T�a6�C���],���r^~;}N�_�{�L�.��p�D����5l3�k�v���:����p��-IG�@"�1Ҹ�z�n���3��<4�x�3;U����y>H�_�O?��� �i��      	   Q  x�u��q�0EѵU��c�@ �Ԓ���Ll~���c
ha�'���ͬ���|1?�sJ\s�ͤ1���RBH)��d�4�|<��C�T5��Z	�b�Ny�z�ZB�B)ׅ���F��n����tK�*�i�⧜��
�y���2�ɖǵ�$5�����xD�P))��T�� �b��mT�Y�o�|ۇ m��U$��w�%xD�<ǙkQ;!Ɗrt�TD���w�˙~�(�%���Ӟ)�A���*']�iD%[
��I�L�N�S�J����r��2��o��r������T�M���C����u}������P�-�)#�Y��{��[�M�u� �#�      
     x��Wˮ�4oE�V���0 !�Ą����QS;8���c���<toRG]{-�����I�ښ�d��Ǻ���М�].v�dDVBT�b��o��? D�۫��A��A��5��2��>\2m���뷍2��6�x1Wݘ������j�u���K���$
G�/����Y ��M�]�
phϮwT	Q���S�X���vk9I	�ںN�6���p�k���j��dܝ�l��`l��ڞ�J0���m�HpоϬ��}�*"��ܳ�pvn1%��.)Mh� D%t������,J���E� R�)i��I)�	Ko�_Q���9�a����B�@[�[;嫊Ɋ�X�9}� �p�g��_L7�n!�`��ӹ��<���e�*#1'㮦��8����
3�	�� wo�t@�W�����>����G8�ӂ]Vy������p�}��*'c8�5�O!�J8;里�A�b31/�B<�S��t�\%ˁK������&Qd] BH��?|��o_d"By�\Сr$�O�~�Ud�0gCϑ~�޿e�\��*EEs��� D���ٟ������
<̬��M/�4U(���"��CX�B�Y�Φ����@�>%�4r
�a��W��&'s�B�Am;s���3\@�s��P����8+9�+��, ���l�A6}��,LŠ�Όt!.�,uf�'"zUhY��?�N����5�.0X	Wpw���Y�G)J�ߺ~N��*1W���9tV_�SV�2�k��c	]�fãab�'�CH�><��h�<��S,�AH0H~�)c��K5����L�Y*#����jz�- $���[�*���L��w��E�%-�,	s��F�~Φ���͑��!$t����,d��{���H���}��L�<�����vϏ�g��O)� $s��f>��3FF�#��=	!I@��:]=���1�lN�BHRhuכfD���qLBH��0��C����l�rO��E��"S�׾NG�jU`���p��uq�ح����!�F�&���         �   x�3��Nͫ�LM�/)��-vH�M���K�υ�s�%�X��&G�;D9��{�E������9�億�z��;�&��뻅G�y;d�&�&�r�����������������������������)�=... fD+)     