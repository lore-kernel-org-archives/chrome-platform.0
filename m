Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 505B27C
	for <chrome-platform@lists.linux.dev>; Mon,  4 Apr 2022 17:20:32 +0000 (UTC)
Received: by mail-pf1-f171.google.com with SMTP id f3so9606065pfe.2
        for <chrome-platform@lists.linux.dev>; Mon, 04 Apr 2022 10:20:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=hJ8bbjWFJKjLu66jwXccFuALP/4fGo0kGnkSd+Oc2dM=;
        b=gT7JmKKPtC5bb7aW02zGlFlbOq2qYMtLpTeaNDwP8oJxKlpEq6HHzVJJb8Ql9VeSrg
         nBTknQJpidDl7HSvy3jFJTstwMh/K1G+H+5IAAxNrYKncecQcR7mhYsBGKmLQcBPzvw0
         xA+UkJlbohJaWxUMAVilVLqv8mmygao6QeCKEC+GjqOu+jda5o/ROaTRns5aFHUUmbe1
         AvWl8OogjmIdpAtND4C72NXmUjS2qYm1JxO0fZrS728772lAZk9OSbTko/hRgRKVeUKf
         LjXmMG8QvfKVkN9/UWbOALY80lxTKFUlu55b8N5fqD5JA6dCTS58g+MYUeRER+FkQJ1l
         9/uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=hJ8bbjWFJKjLu66jwXccFuALP/4fGo0kGnkSd+Oc2dM=;
        b=hg2F+9vj1YyZgLioHrcSM8j1kEVsb3XPWfuqzJUaCcAMW1sgGZ9RypOYdOnhwESPT7
         PcYqPXuy34oZBCPxpcHMZ9flB5kvpBo2fGDQ2gZY7ayQqYIt4eVkVYDELPjXP2ORtcls
         U3Rzkv+2OitLmDs1Awq3xpr1w56NE82+1FbzfUKrn0p37URTrV1ZqYByGOF5fUrJKOzG
         13+FP4MPDAwre+9jSaaQQLCq/hmdpS0RORWOvRGVKQGOtVXvgbYPtmC8am10dF2oaUQi
         Cm/i6YETr/Ab4nSByxAJuhNnm6rRToRIv9oB9XWKpe/g5Eb9xa9Iwbij9jvTI8LO3nHf
         fO2w==
X-Gm-Message-State: AOAM533ZUoeX+cr6jRCYSTV+4tn8cciNbFiTra8yvUKgunvFq2c2pJrB
	ThV8+X//b0TbfUK3noj1OQYSPg==
X-Google-Smtp-Source: ABdhPJy0T1LDIICCzyUvPFRaeCnlxx6MSrx04MSkZMmC5V1lnbZfDroyBvKkf2nhxU1uxIFeQ8tbuA==
X-Received: by 2002:a63:451b:0:b0:380:b9f8:13f4 with SMTP id s27-20020a63451b000000b00380b9f813f4mr753130pga.367.1649092831283;
        Mon, 04 Apr 2022 10:20:31 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:737a:249f:720b:a0a2])
        by smtp.gmail.com with ESMTPSA id j8-20020a17090a060800b001c7936791d1sm74019pjj.7.2022.04.04.10.20.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Apr 2022 10:20:30 -0700 (PDT)
Date: Mon, 4 Apr 2022 10:20:23 -0700
From: Benson Leung <bleung@google.com>
To: Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
	patchwork-bot+chrome-platform@kernel.org, lee.jones@linaro.org,
	robh+dt@kernel.org, bleung@chromium.org, groeck@chromium.org,
	thierry.reding@gmail.com, u.kleine-koenig@pengutronix.de,
	matthias.bgg@gmail.com, agross@kernel.org,
	bjorn.andersson@linaro.org, dianders@chromium.org,
	devicetree@vger.kernel.org, chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-rockchip@lists.infradead.org, pmalani@chromium.org
Subject: Re: [PATCH 0/4] mfd/pwm: dt-bindings: google,cros-ec: include
 generic pwm schema
Message-ID: <Ykso11bQLqJS1+jU@google.com>
References: <20220214081916.162014-1-krzysztof.kozlowski@canonical.com>
 <164909246180.14329.3397709419938843373.git-patchwork-notify@kernel.org>
 <2259298.ElGaqSPkdT@diego>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="I++PcjqoBe2chj7C"
Content-Disposition: inline
In-Reply-To: <2259298.ElGaqSPkdT@diego>


--I++PcjqoBe2chj7C
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Heiko,

On Mon, Apr 04, 2022 at 07:16:03PM +0200, Heiko St=FCbner wrote:
> Am Montag, 4. April 2022, 19:14:21 CEST schrieb patchwork-bot+chrome-plat=
form@kernel.org:
> > Hello:
> >=20
> > This series was applied to chrome-platform/linux.git (for-next)
> > by Heiko Stuebner <heiko@sntech.de>:
>=20
> does someone know what goes on here?
>=20
> I did apply only patch4 back in feburary and I definitly don't have any
> access to a chrome-platform tree ;-)
>=20

Sorry for the extra noise. It looks like patchwork-bot did this once I upda=
ted
chrome-platform's for-next branch to the newly created v5.18-rc1, which
contains this series now.

I'll look into quieting this in the future.

Benson

>=20
> Heiko
>=20
> > On Mon, 14 Feb 2022 09:19:12 +0100 you wrote:
> > > Hi,
> > >=20
> > > DTS patches are independent. Not tested, but I really hope no downstr=
eam kernel
> > > depends on pwm node naming... If it does, please change it to compati=
ble. :)
> > >=20
> > > Best regards,
> > > Krzysztof
> > >=20
> > > [...]
> >=20
> > Here is the summary with links:
> >   - [1/4] dt-bindings: pwm: google,cros-ec: include generic pwm schema
> >     https://git.kernel.org/chrome-platform/c/6b94ee669e8a
> >   - [2/4] arm64: dts: mt8183: align Google CROS EC PWM node name with d=
tschema
> >     (no matching commit)
> >   - [3/4] arm64: dts: qcom: align Google CROS EC PWM node name with dts=
chema
> >     https://git.kernel.org/chrome-platform/c/1e49defb8636
> >   - [4/4] arm64: dts: rk3399: align Google CROS EC PWM node name with d=
tschema
> >     https://git.kernel.org/chrome-platform/c/a0024f55eb5b
> >=20
> > You are awesome, thank you!
> >=20
>=20
>=20
>=20
>=20

--=20
Benson Leung
Staff Software Engineer
Chrome OS Kernel
Google Inc.
bleung@google.com
Chromium OS Project
bleung@chromium.org

--I++PcjqoBe2chj7C
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQQCtZK6p/AktxXfkOlzbaomhzOwwgUCYkso1wAKCRBzbaomhzOw
wqOHAPoDrc7kOcLWzZJ2QaFbD5e9sHTDrFveD2rboH94WtDKdAEAwCFF72Jc2NWP
VqsIhq74lcj3+0HrIDsVeRyNJ3A5twM=
=TGfb
-----END PGP SIGNATURE-----

--I++PcjqoBe2chj7C--
