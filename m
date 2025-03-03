Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8D3E1E5B6F
	for <chrome-platform@lists.linux.dev>; Mon,  3 Mar 2025 07:08:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740985694; cv=none; b=hiY6xNxYOtXa9Ops915pnYyU1oeuihJsMpbpDtlIJeh5ClkU0iGKxQ2OsYEbeqNiC27C31Zya6DciSoD6zPpdk+26LE86isDsMC1cM6NPylzhOy4NKtUKPR0CU0gDSGPzthdxyKq4KRZ8ROqTzZ6OSArGb0rOLE1kquk0YKbW5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740985694; c=relaxed/simple;
	bh=k0s1zoqCwF7NrMnsyzRl2nJZzaiZ5CaTUbqo5y8w+TI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iiPH3y+mxY/90dOrvz6B+T6SlT3b0IXRLI/FvM2mXv+7vJk0FsiPeUbS8tVkLlS6Xy64nIs/BQ9AYAnzE9s0RflGW7BI8q9cR2WeCBsHvNVx1ieAPpfgcoKYnR3+6NkWo6rnW3bkK4fneCT/B4WuYTMyNs3aGqfgO/qB8xVdgoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=frame.work; spf=pass smtp.mailfrom=frame.work; dkim=pass (2048-bit key) header.d=frame.work header.i=@frame.work header.b=FUce3267; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=frame.work
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=frame.work
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=frame.work header.i=@frame.work header.b="FUce3267"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-2fee05829edso2697920a91.3
        for <chrome-platform@lists.linux.dev>; Sun, 02 Mar 2025 23:08:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=frame.work; s=google; t=1740985691; x=1741590491; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MDZFVcYDjYmhUC/IeXT22/0bs2WUbeQV9WygPjJbNqE=;
        b=FUce3267W2QUtYYvWO9Bgz1EbTFiIbyRgjle3Frpoz2AlZdjXjsXzN95LB+FOfJsUp
         nRXfO5m2vWQ3OVaZb1U+6JNAXTx/W/pzQnHNtu+OCoE96dpLHG2KSKYjvsHkgz17FENk
         VHMHlEHXFKlsAiCtGjFGcAWRjoJjjERtrYyvTxn/poCoAXXb3ukx1dTMHGxmY3L9M+1K
         p+ufNL98KWTYuUtLBM/+mAgkJTP3FrVfHrInkWZCoQtkWPhQS0YxbL3Cr08rT1etiyLu
         J6Gb72cASfAyEYXJVAFk6MxeoiApqGrbv1q/MxdQMaGeoEArqW3jn8UmlWaU+kZ6fnab
         jWxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740985691; x=1741590491;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MDZFVcYDjYmhUC/IeXT22/0bs2WUbeQV9WygPjJbNqE=;
        b=ORI5e+7m4dHtrTsYlOC4ErlzYVUZ7MG/jPjDg5s5ZP1ekwytJVb2IhqrpIUkFP+UYA
         1gjJJQxiqYEIbvzlKH83XRg422yFQ/1mweqSVTGuEtDKyLespVsxIukFrT7zHfw+zqkD
         DK2wDZkOlzDEJ1+54+QN6VSMxvgBN2nvfNDFZF7XLpkNWMHs9viibPVsfsqAv/Gwq3CF
         4Ts/U4FZmobdgNX7eikksUSws/uz2rp2pQZvMwRpBIbujP3wzNKtwWBvoSBoEiezmbRb
         0zkgcj+G6Qi1dXUcDJDQh1WS6ivEU+tiBHYA8KsTFcovkGk3vg3YGIErB70g1038bqle
         KkcQ==
X-Gm-Message-State: AOJu0YwuMf8n86i0q6syB98PqrLdsVmLXyi7oMOB83RZuNacMV3fGa2N
	isg8O5RJW0EEgb8BttOp1dGsmon6q5nUymKpuge6R3IrgmutxhG4Zwx3nsa4Y8MVpnIuseO3/n/
	twG3aumf/qWxEahFRQrNFMOrdLO+f07VbCCfobQ==
X-Gm-Gg: ASbGnctvqOk3Jr+GLeFqXeViWwKFNw3NVPuG8HPwyVDSFqKB3Q93IZwzwgF37zHtnBe
	GJOPWRrzzh6cLmvLhI6J1ydHkrJyjOrpQGbCihSOa5aZokEDxlDwaR01H2/7bRudSnQz+ZU5uH5
	canJYUYNqMlRW5xx/hbV8ipzE90po=
X-Google-Smtp-Source: AGHT+IEkUBfmVoSV7Az7Lhyg0xo1unkdDYvHgNB+hiWE1n7t2CKgOyOXAC5vygTkwCmofqUZxHUo5lWGNeMLOFC89GY=
X-Received: by 2002:a17:90a:d605:b0:2f2:8bdd:cd8b with SMTP id
 98e67ed59e1d1-2febabf199bmr19148706a91.29.1740985691043; Sun, 02 Mar 2025
 23:08:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250220023441.158615-1-dhs@frame.work> <Z7b6Wg-Ui2p_bnCO@google.com>
In-Reply-To: <Z7b6Wg-Ui2p_bnCO@google.com>
From: Daniel Schaefer <dhs@frame.work>
Date: Mon, 3 Mar 2025 15:07:59 +0800
X-Gm-Features: AQ5f1Jqofx2TZ4iMMD0RMQJW2Ojd_BHjbi701RC3z4KR2VXjC8c4VhU8gPN1N3g
Message-ID: <CAAjcXz7-=MK-PmEior_dQbEHNa1gLJiFMPqYh3c5BVKUTOfj_Q@mail.gmail.com>
Subject: Re: [PATCH] platform/chrome: cros_usbpd_logger: fail probe if HC not supported
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: chrome-platform@lists.linux.dev, Benson Leung <bleung@chromium.org>, 
	"Dustin L . Howett" <dustin@howett.net>, linux@frame.work
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

You are right, if we remove this feature, the driver won't load. So we
don't need this kernel patch.
We found there's a bug in Chrome EC where it enables this feature,
even when the Kconfig is turned off.
We're including this patch in our future Framework EC builds:
https://github.com/FrameworkComputer/EmbeddedController/commit/57030a466bb7=
e130313cf2b2a305a753e9c9a55e

On Thu, Feb 20, 2025 at 5:48=E2=80=AFPM Tzung-Bi Shih <tzungbi@kernel.org> =
wrote:
>
> On Thu, Feb 20, 2025 at 10:34:41AM +0800, Daniel Schaefer wrote:
> > If the EC_CMD_PD_GET_LOG_ENTRY does not exist, the driver does not need
> > to stay active.
> >
> > Framework Computer systems don't use the PD infrastructure in the chrom=
e
> > EC firmware, so it does not support this host command.
>
> Does the firmware still report `EC_FEATURE_USB_PD` feature [1]?  Similarl=
y,
> do "cros-charge-control" and "cros-usbpd-charger" need to stay active [2]=
?
>
> [1]: https://elixir.bootlin.com/linux/v6.13/source/drivers/mfd/cros_ec_de=
v.c#L263
> [2]: https://elixir.bootlin.com/linux/v6.13/source/drivers/mfd/cros_ec_de=
v.c#L89
