Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2F041FC2
	for <chrome-platform@lists.linux.dev>; Tue, 17 Jan 2023 09:41:19 +0000 (UTC)
Received: by mail-qk1-f177.google.com with SMTP id x26so2645919qkj.4
        for <chrome-platform@lists.linux.dev>; Tue, 17 Jan 2023 01:41:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hdQxBMQOMwqD8VUok85rROkSgj2htMeyYzI/9JQJnaY=;
        b=HdpUBrzVC+fRm5us0I5pcSVClglYaFUfiEm/cGmO0HRwQ+aYU0HVym6Sa1QAveTfcy
         HVrNoblnZL7c17Uzkx9cWtDUNfb/se9p1L8E0LImXSu+eOf5/sphsIlfsbxsZUBcSG3A
         epLckHWQLqK9BHTP8K/H2nWLrxRMmIziEGtmrfzMCzTlKxaNHqt+yQ5uevBzAlX/9/dD
         eraOfE2nSwKxtnVs7ghhKhl4PJs4QjHGI2ViGL60UKvVQ0h5+wkTdiujQa4bIuASu3/g
         mGE/ZB8GT3isx1sHuKZF2MZCBZI+i9AXRO9tTxFkQbgjJOCiiAphcf9gB63ctNnSGHL5
         ktCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hdQxBMQOMwqD8VUok85rROkSgj2htMeyYzI/9JQJnaY=;
        b=KDzDoBYmPlZjIfZgehrj/HrTO6BXS77+oZ8G5/Vc1aLcNM0xS5X6SqgrfHSnSPB9+k
         hM9Lkm8EUjxSxq2+7Up9RLd0NrLOsl6Iy3cnxAmoUemmJrFDDVP6fr/smL0yYuTwY9ZF
         u1z/hfHaHiFVPfa28VyKo+zMqUqBfDKppanjTMt5NhojN1iiLafTajaTU0EKGy4YueKE
         wMdol7/J8TVKZa/R0jvFRy/vjn9Zr0sYeBCnz9q3b76fvi/vs2/IRPRJh07Hjo3UXQgF
         IG+9m1AZ3QTdZaImo3ep7IQjZ92tFvaE+03G2MiM/iY7CvPATCPHt2/bJPTR5AtIt2PI
         1DVg==
X-Gm-Message-State: AFqh2kqIozRJLeHhZiA80VvBPxAPBH1glsc8dAv//HnzMqoqS17tGbV/
	bIckioaCKGvU1++wn2x55rELrQq2Hz2Uig1pVeg=
X-Google-Smtp-Source: AMrXdXvUweQfxPG9XW/trbF8uyUaDAKToxBAJ8l2RD/emKWwnVOskao8jQNpBm7SRN0AryYBpZ/goUm0u7jIv/pAfEY=
X-Received: by 2002:a05:620a:36f4:b0:702:34dc:25a8 with SMTP id
 cz52-20020a05620a36f400b0070234dc25a8mr95984qkb.748.1673948478628; Tue, 17
 Jan 2023 01:41:18 -0800 (PST)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220715122903.332535-1-nuno.sa@analog.com> <20220715122903.332535-13-nuno.sa@analog.com>
 <20220806192048.0ca41cc5@jic23-huawei> <20230116204452.il4gase2szipeexz@SoMainline.org>
 <CAHp75VdX9sFgn9STyzwcDCK1KYbU00ejFNcEP3FVnLk5J=Pktg@mail.gmail.com> <CAHp75VdTftm1BE21rH1HVHiwUye-0Dvc66uCK2LE2qF4_zA6hg@mail.gmail.com>
In-Reply-To: <CAHp75VdTftm1BE21rH1HVHiwUye-0Dvc66uCK2LE2qF4_zA6hg@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 17 Jan 2023 11:40:42 +0200
Message-ID: <CAHp75VdyCA7mQdm--kg=hUbmQqX4-jfFMHgLxref5mNSM1vnMA@mail.gmail.com>
Subject: Re: [PATCH v3 12/15] iio: adc: qcom-spmi-adc5: convert to device properties
To: Marijn Suijten <marijn.suijten@somainline.org>
Cc: Jonathan Cameron <jic23@kernel.org>, =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	openbmc@lists.ozlabs.org, linux-imx@nxp.com, 
	linux-stm32@st-md-mailman.stormreply.com, linux-iio@vger.kernel.org, 
	linux-mips@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, chrome-platform@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, linux-arm-msm@vger.kernel.org, 
	Gwendal Grignou <gwendal@chromium.org>, Fabio Estevam <festevam@gmail.com>, 
	Tali Perry <tali.perry1@gmail.com>, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabrice Gasnier <fabrice.gasnier@foss.st.com>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Miquel Raynal <miquel.raynal@bootlin.com>, 
	Eugen Hristev <eugen.hristev@microchip.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Lars-Peter Clausen <lars@metafoo.de>, Paul Cercueil <paul@crapouillou.net>, 
	Claudiu Beznea <claudiu.beznea@microchip.com>, 
	Michael Hennerich <Michael.Hennerich@analog.com>, Haibo Chen <haibo.chen@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 17, 2023 at 11:06 AM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Tue, Jan 17, 2023 at 10:53 AM Andy Shevchenko
> <andy.shevchenko@gmail.com> wrote:
> >
> > On Mon, Jan 16, 2023 at 10:44 PM Marijn Suijten
> > <marijn.suijten@somainline.org> wrote:
> > >
> > > On 2022-08-06 19:20:48, Jonathan Cameron wrote:
> > > > On Fri, 15 Jul 2022 14:29:00 +0200
> > > > Nuno S=C3=A1 <nuno.sa@analog.com> wrote:
> > > >
> > > > > Make the conversion to firmware agnostic device properties. As pa=
rt of
> > > > > the conversion the IIO inkern interface 'of_xlate()' is also conv=
erted to
> > > > > 'fwnode_xlate()'. The goal is to completely drop 'of_xlate' and h=
ence OF
> > > > > dependencies from IIO.
> > > > >
> > > > > Signed-off-by: Nuno S=C3=A1 <nuno.sa@analog.com>
> > > > > Acked-by: Linus Walleij <linus.walleij@linaro.org>
> > > > > Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> > > > +CC Marijin who happend to post a patch for this driver that I just=
 accepted
> > > > and hence probably has hardware access.  Any chance of a test for t=
his series?
> > > >
> > > > If not, no problem as this is fairly mechanical and we have testing=
 on some of
> > > > the other drivers using the new code.
> > > >
> > > > I'll probably queue this up in the meantime but it won't end up ups=
tream
> > > > for a few weeks yet.
> > >
> > > Jonathan,
> > >
> > > This CC just surfaced in my inbox while searching for our current
> > > discussion around missing labels in qcom-spmi-vadc - and on the side =
a
> > > userspace @xx label name ABI break (in qcom-spmi-adc5) caused by this
> > > patch's fwnode_get_name change - we could've caught it if I had not
> > > accidentally marked it as read and/or forgot about it.  My apologies.
> >
> > Does the following addition to the top of the
> > adc5_get_fw_channel_data() fix the issue?
> >
> > +       name =3D devm_kasprintf(adc->dev, GFP_KERNEL, "%pfwP", fwnode);
> > +       if (!name)
> > +               return -ENOMEM;
>
> Okay, it probably the same, so it might need additional code to
>
> + name[strchrnul(name, '@') - name] =3D '\0';

I have just sent a formal patch, please test on top of non-working kernel.


--
With Best Regards,
Andy Shevchenko
