Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.215.175
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1792487637;
	b=N4LMOsB39N5Mx1DiYd/u54v+lBluRHibgkUYv5w/bt7iDIN4fA6yEASMuY/capgF6JJx
	 6xuADl38uyOKkbpckcURaEdmClC5PWcrgk9T1skTXKZYnd45mTJEDFXl/NUws0+rG7wIk
	 Dp6QmdH1zoi9keLchPSexcnYqlMJw6Vdn4Iomm49IC6Vd9KJaRFtZ9wXcoHNThV0AqV7n
	 VGrKbV0pB/nqubv/3UQL6irPMRh/0mKNrPTaBf6VWuVzsoAcZ9wIvBzMflYxu0CmgYHyS
	 uvYZcsPPJMgXhGZQAfphQ25bltzqRUd9QAJOn2RQnD1mCuddsdB1BZLSF3jjwOPoj/w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792487637;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=gnEpenvt+GUBOtfxEpiHDL8sSuff/Tr1knZSR+pi58g=;
	b=pF12ZTPfnhosor5j0X4PnA4A+4qT+XonXOtaMRfnd2N+TWY3VL/xoPAf/Kjhf5VROixd
	 Q/3HFGuuWCuWY/bdQ1HC64QukgQHVDYcxge+T3eDOaffRzDntmYsTNgpBFqLADfM1YPYm
	 ZxmsMrSec/+heRGlTp/k3hsf+tPgtUK6cvpdII1MXjVN4YQRg5cnJLl17t0n4kXUr3MuK
	 JjUeLYcApEC7B5bdNxtTTZ/Ouj5oiSnouG72IXav1WpYit1ZZc3xvhMd3lmNAQN6usTXb
	 Pcdfvw7089z57NLbS9YGAynNJ9BVg461Pv9DEouHzesdihMISCXOsOVPrVoWIaMBTYQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=BJ2lzymt;
	arc=fail smtp.remote-ip=209.85.215.175
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1540606A32F
	for <chrome-platform@lists.linux.dev>; Tue, 20 Oct 2026 09:13:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B1540606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=BJ2lzymt
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-cc4dbda1e5dso897955a12.2
        for <chrome-platform@lists.linux.dev>; Tue, 20 Oct 2026 02:13:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792487636; cv=none;
        d=google.com; s=arc-20260327;
        b=hfoQrsSOZxhVtSVCTvVKyv/5XC76MvfXawvgBcedby7vwVn8CgV2BWr8VkiRJkf5w9
         /gPFH3SzxA3aHGs7eSrvlPSkuf90Ov14BZ/MZibAPrKnNv7JgdxRo1b+X+LP0Q8GcMsB
         4KvT2bbgvgdi+7dfojIDCYK2/TPqAT3blWw4QGbLk4eJs/pizSaT13wjOvVd5C/28MdI
         L8/69izMZHuvrOcMb7q5w9uAVQQ35oCyneLWgPzZ72agthYeAnTDNxIXL0WBtatqrbbn
         Yvr08rLbdqU2f4AbKce8dCBQ71YuOggFNWJrKmE0TFTudLtMR9yUn0uX9ydl5XcEGGzJ
         boLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gnEpenvt+GUBOtfxEpiHDL8sSuff/Tr1knZSR+pi58g=;
        fh=d+SA9p0GjG1+bKp+VVauddNAA6yvwN0H9qcbuaBpib4=;
        b=jmEelg1WAUsoDNVG4xO6B+LnMmpbNb9v1nxp9+IMG2Hr5e6wjB5wH+Vgb7cn60kXWv
         5FzmJNsphMqQWFMRpFTPyUrsP+EnVBqIOQ4qJDGHiRGEtcJRGX0xYxujqMZrFdQnylrG
         abXfxjMfrEBqxA5Dg7YQEmoRrW6OKs5MydqKfgfaaaxVNxQOl+oJ25m9sUBK36h7l4TO
         GUL1xQHy1cfup0TomhRrKuYPJ3cOh+LNy8TpxXNoL4wCVF/Z6eA/HcxyKeakRYM7rpDI
         k7WDpTtKj4n83FsC5TM3AeysIlp3WmHQP6/JmRGRbjN0me8uoadA285KbJNlCLkPTs4h
         LhBw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1792487636; x=1793092436; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gnEpenvt+GUBOtfxEpiHDL8sSuff/Tr1knZSR+pi58g=;
        b=BJ2lzymtYQ9PhrloIyImtcUw4vJvSbUVaDEtsGSgh/shxZW46jy1LtJnCt03d+VQDM
         bEDTsGCEBWatzyUm20GISFrvz/UvETE3kpXvsPiWAajoLq/8HE3eYAmSxEchJ0zpZyNe
         21zhmpGxwjrcaPRK0stl2DtcEcy1X9TOlzAUw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792487636; x=1793092436;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gnEpenvt+GUBOtfxEpiHDL8sSuff/Tr1knZSR+pi58g=;
        b=Jl3By2GO2rm4KLZco6xBSDJBmYVGkrCigFuiyTkL8caOxdtDiHsXc93m5PPOuWpR2t
         exJU6HxrE6rXsEAn/ksg2o8fgjk4khYDQ3SMauQaCQg/J9HpD+WzqpPCXTmgudfIzEtU
         F6tIOQFhtQNXyGgG9nBxVt4i/x+xU7klymq9MrzPFCMIYAwaHdhLBDukj4TsIQHRPjp/
         Qe9i1AF+Bs287CQLx4JEU3hd6BXtugN4mc/U/GVGro5oGu+M4a32IYOqqcE/3ripRo6K
         YzdByz7bZrzvCS9LLQtWmSfF+3vAY395541T5pMXj2AHL2P7oa4Ej4PKNMjavl7wXyja
         3wLQ==
X-Forwarded-Encrypted: i=1; AKwUvBz837d+SvjuADGkCvp2xL86S0kfvuBwLmju+56XpT50Xio9TRQDXn/PyyhfXx3TaaELS/lFXRNKIDx+JxpY7XM=@lists.linux.dev
X-Gm-Message-State: AFq9FYI0AnCSYByajlxqZfn2YrrxrXwLYlAwmbzDVGHiof9CNdI9wIDl
	IpNCyqkm/v95ABqPdiKSf2SHnPeL5HKYdXxGIP+h8QXKEuedpZtVjBacMeFZAJdtdZf4hyH+KOn
	YXE9u4Z7xCZLNOz1MP6mO8DfgCUY8Vdtcbxiq9qGW
X-Gm-Gg: AYBFou0D8sv8ElU1V7UhgSRg0+R28rkwTdcjuHCFFic9D0IICV8kEX0la+yuOedTFT7
	AF9dkn35kBEb9Q+ljEsEMkmIM8vuWopnsOodRS3KcslqCJqIvKxfbn2l1p9ZV/0utPnNiCkfMQm
	p+Gp+5ajo6Pns773s3BtMb1KOO7Qkd2E/+HBwjVdCEWgIO36uMu28d+FgisRisvV5XaiOw0mLVd
	IZkJ/P2MKNX0QG3PMeGLYCRWI3M7zMPTl0BONkSv2vSHv5k3boCVmsDrYHeWs76/j/TaYNLIyU1
	A54gRjZIwaNykE4ED6XEggpRjklVlDCkfh3RfZcgLaiu5pKU4wmk+E6PQ7df3S6p1YpeQm5iBMy
	k4LTOuERfYIFylw==
X-Received: by 2002:a17:90b:1845:b0:3a5:1b:34a5 with SMTP id
 98e67ed59e1d1-3acef506a0dmr8831280a91.49.1792487635692; Tue, 20 Oct 2026
 02:13:55 -0700 (PDT)
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Post: <mailto:chrome-platform@lists.linux.dev>
List-Help: <mailto:chrome-platform+help@lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
List-Owner: <mailto:chrome-platform+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261008134056.3816556-1-akuchynski@chromium.org>
 <20261008134056.3816556-3-akuchynski@chromium.org> <atDDunhd_1mucOVh@google.com>
In-Reply-To: <atDDunhd_1mucOVh@google.com>
From: Andrei Kuchynski <akuchynski@chromium.org>
Date: Tue, 20 Oct 2026 11:13:44 +0200
X-Gm-Features: AclHuK-IikjZ7p_nqJNC6TxS3TMChIviiM1vHKrzfiG-2lIHM3azwzb2rJdLiFc
Message-ID: <CAMMMRMdpOidJsFdSyscZ23jZ9XXqhEn_Hyc4P6+e3JVM3cDbDg@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] platform/chrome: cros_ec_typec: Reorder altmode registration
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Jameson Thies <jthies@google.com>, Benson Leung <bleung@chromium.org>, 
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 15, 2026 at 2:14=E2=80=AFPM Tzung-Bi Shih <tzungbi@kernel.org> =
wrote:
>
> On Thu, Oct 08, 2026 at 01:40:56PM +0000, Andrei Kuchynski wrote:
> > @@ -406,17 +406,6 @@ static int cros_typec_register_port_altmodes(struc=
t cros_typec_data *typec,
> >       struct typec_altmode_desc desc;
> >       struct typec_altmode *amode;
> >
> > -     /* All PD capable CrOS devices are assumed to support DP altmode.=
 */
> > -     memset(&desc, 0, sizeof(desc));
> > -     desc.svid =3D USB_TYPEC_DP_SID;
> > -     desc.mode =3D USB_TYPEC_DP_MODE;
> > -     desc.vdo =3D DP_PORT_VDO;
> > -     amode =3D cros_typec_register_displayport(port, &desc,
> > -                                             typec->ap_driven_altmode)=
;
> > -     if (IS_ERR(amode))
> > -             return PTR_ERR(amode);
> > -     port->port_altmode[CROS_EC_ALTMODE_DP] =3D amode;
> > -
> >       /*
> >        * Register TBT compatibility alt mode. The EC will not enter the=
 mode
> >        * if it doesn't support it and it will not enter automatically b=
y
> > @@ -433,6 +422,17 @@ static int cros_typec_register_port_altmodes(struc=
t cros_typec_data *typec,
> >               port->port_altmode[CROS_EC_ALTMODE_TBT] =3D amode;
> >       }
> >
> > +     /* All PD capable CrOS devices are assumed to support DP altmode.=
 */
> > +     memset(&desc, 0, sizeof(desc));
> > +     desc.svid =3D USB_TYPEC_DP_SID;
> > +     desc.mode =3D USB_TYPEC_DP_MODE;
> > +     desc.vdo =3D DP_PORT_VDO;
> > +     amode =3D cros_typec_register_displayport(port, &desc,
> > +                                             typec->ap_driven_altmode)=
;
> > +     if (IS_ERR(amode))
> > +             return PTR_ERR(amode);
> > +     port->port_altmode[CROS_EC_ALTMODE_DP] =3D amode;
> > +
>
> It deserves a code comment to note that the registration order dictates
> the priorities.

Thanks for reviewing.
I will add a comment explaining the registration order priority in v3.

Thanks,
Andrei
