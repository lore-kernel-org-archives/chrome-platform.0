Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE20830E0F6
	for <chrome-platform@lists.linux.dev>; Thu,  6 Nov 2025 18:21:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762453305; cv=none; b=F+ZC1fa5E3lX9WvSupgAhXu+1IUuI/NQ6ZXIThzF4htM3nXzZh0BVrZs89ok51tIBeHmcNNT2kFVTWTo67DQMbNm2JuGWypBAy7Ep3vUUECi+nbrGl0A22+mLGeU1T0y/dFYo8iX+rukKqlLBpY5nZoLbIXa1u2NQa5/nyYQolU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762453305; c=relaxed/simple;
	bh=S6IGYBBDmC8dLHoMGr9C7EQYKSCOuNtAEg+rHyPaHQs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cAqj6nwwJ9ibGVzps35C98vamEqbSR1wXCKvvOO66R8mzZjRK1R6F5qQr0KlTw1YxMLkcXn9bUJv/zyLFcES25mIRMCp5HpVlPuSZerWK+aH7vslGGObNDdRpIUA+IubHmltbl2Lki/dT4cq5TlGLVNU/o2jNSy53tu4GWqc2xI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=d9nG8AOk; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="d9nG8AOk"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-7a435a3fc57so1454309b3a.1
        for <chrome-platform@lists.linux.dev>; Thu, 06 Nov 2025 10:21:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1762453303; x=1763058103; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n/uY7+JVbofrnb0xY1CmpLxlpuZ3PWjT1kJgbc7DbmI=;
        b=d9nG8AOk2ylF9wTVZKpwP+cFHYzu/y5LH7ZwmT4hdcff4P9jYDv7ZGmPRx9tNNv4xg
         +sWecyEHsAJa8bAgbqbcF+YmqpYkAEn0POymHQLtloPDl4375GRZyGvVdECtZ80f3kZg
         Pd96hDmK9Me5AapEtgta0MUPheSIZCQ60pOR0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762453303; x=1763058103;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=n/uY7+JVbofrnb0xY1CmpLxlpuZ3PWjT1kJgbc7DbmI=;
        b=pYBLqPnXwUaVQgVh9Uemlin0UaRqSENf0ar3G7Q/56BqG+HMCTfpAGWRj347H9F22T
         FMnbs7GYvmKBiMpmN/AqEgpXNhh2SovxOEDtHhA9nYsHkYUhZ3P1OQPFYhaiw01Wnf/d
         D6nDr/X8v4kCvy+XBcwsk7CxdtDAtOsVcRJEQofD3ujgCdB5a2Kjs1mfjQ+PQdu7l/ce
         NtxFdQJG2yllrP2LJsXuPGggzUkWOfTBM5rjOvgVUhVjyGPRSbivhRSZT6KE760ws6CB
         g2vqZlBTKtSpXl53TRhuiTA+e9I5XR+IMHiGmlMXDIDqXUbXpojFPoBKr9HaH8kDebov
         luXA==
X-Forwarded-Encrypted: i=1; AJvYcCVTWcl0qIi2oW6XBNLidwPkbXvOwotpheM5YLAHWuYgl3g8XsLrzJwwWY0pDNZ3887O9Q3IESLTB6wLqbSrRzw=@lists.linux.dev
X-Gm-Message-State: AOJu0YyrNVMTyG1f4/3lwFCfr5KRVkOdbOtWQ33/po9YCHRCZlo+XEfn
	h55wtxuPgBOsNkihS/5MkeKCu/hj8jcaMrUzzQAP1F1reKRlA2ME+jf6iJfkRHja9MTx1NBnBpS
	aIFJIsHpqmWhagE0mHm/4iYLEUfY8Mgi07zSBS8P/
X-Gm-Gg: ASbGncu3QCZUbXVjELz3BlJGBFvj7nAtOFPuZ7IVGCclf4Tu+9YNpl4r4Yq0xsNvxNt
	c7K3lHmftXFxmWDhFxvlDOM6Ql10fiEUsCNP3ZalwUOuf5+vWLSQkHKI2as9jXOJemHeZ625zNM
	OyT97fBQ+7r0oGTTlV57nvibIapjXEz2e7oRaB+D0pD8N2MK+FTUPOpEVhg/BkOZYN0dBY8wEMO
	uhty5c2rIOJ5lCSB84Rz2x01YBkaAUtRwSVKRYDDzcTkNGmbQFBsDJNnBjGab35085R
X-Google-Smtp-Source: AGHT+IGqr3GmrXIMcT/NyfIZvvWpHhArzhPvNJ5PgGeULQ7OBJzK+zQVZZdpfuZs1qI8AKKejbsmymnq/rMFCO95DZE=
X-Received: by 2002:a05:6a20:12c3:b0:2ca:1b5:9d45 with SMTP id
 adf61e73a8af0-35229758ca4mr749053637.32.1762453303097; Thu, 06 Nov 2025
 10:21:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251013203331.398517-1-jthies@google.com> <20251013203331.398517-2-jthies@google.com>
 <aQzaq2ord0gK-gaL@google.com>
In-Reply-To: <aQzaq2ord0gK-gaL@google.com>
From: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
Date: Thu, 6 Nov 2025 10:21:31 -0800
X-Gm-Features: AWmQ_bmyZu1_dP_yzvFdUPfiLQKow1ew3PcvaAsktAKcPqiJMFh5m_duCsqHJ_M
Message-ID: <CANFp7mWXyUNbOAzLkT59gSrtPidLafxsrsK0vdn4_JP5uuxd-Q@mail.gmail.com>
Subject: Re: [PATCH v4 1/3] dt-bindings: chrome: Add cros-ec-ucsi
 compatibility to typec binding
To: Benson Leung <bleung@google.com>
Cc: Jameson Thies <jthies@google.com>, dmitry.baryshkov@oss.qualcomm.com, 
	akuchynski@chromium.org, krzk+dt@kernel.org, robh@kernel.org, 
	bleung@chromium.org, heikki.krogerus@linux.intel.com, ukaszb@chromium.org, 
	tzungbi@kernel.org, devicetree@vger.kernel.org, 
	chrome-platform@lists.linux.dev, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 6, 2025 at 9:28=E2=80=AFAM Benson Leung <bleung@google.com> wro=
te:
>
> Hi Jameson,
>
> On Mon, Oct 13, 2025 at 08:33:25PM +0000, Jameson Thies wrote:
> > Chrome OS devices with discrete power delivery controllers (PDCs) allow
> > the host to read port status and control port behavior through a USB
> > Type-C Connector System Software (UCSI) interface with the embedded
> > controller (EC). This uses a separate interface driver than other
> > Chrome OS devices with a Type-C port manager in the EC FW. Those use
> > a host command interface supported by cros-ec-typec. Add a cros-ec-ucsi
> > compatibility string to the existing cros-ec-typec binding.
> >
> > Additionally, update maintainer list to reflect cros-ec-ucsi and
> > cros-ec-typec driver maintainers.
> >
> > Signed-off-by: Jameson Thies <jthies@google.com>
> > Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
>
> Reviewed-by: Benson Leung <bleung@chromium.org>
>
> > ---
> >  .../bindings/chrome/google,cros-ec-typec.yaml | 19 +++++++++++++++----
> >  1 file changed, 15 insertions(+), 4 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/chrome/google,cros-ec-ty=
pec.yaml b/Documentation/devicetree/bindings/chrome/google,cros-ec-typec.ya=
ml
> > index 9f9816fbecbc..fd1a459879bd 100644
> > --- a/Documentation/devicetree/bindings/chrome/google,cros-ec-typec.yam=
l
> > +++ b/Documentation/devicetree/bindings/chrome/google,cros-ec-typec.yam=
l
> > @@ -8,17 +8,28 @@ title: Google Chrome OS EC(Embedded Controller) Type =
C port driver.
> >
> >  maintainers:
> >    - Benson Leung <bleung@chromium.org>
> > -  - Prashant Malani <pmalani@chromium.org>
> > +  - Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
> > +  - Andrei Kuchynski <akuchynski@chromium.org>
> > +  - =C5=81ukasz Bartosik <ukaszb@chromium.org>
> > +  - Jameson Thies <jthies@google.com>
> >
> >  description:
> >    Chrome OS devices have an Embedded Controller(EC) which has access t=
o
> >    Type C port state. This node is intended to allow the host to read a=
nd
> > -  control the Type C ports. The node for this device should be under a
> > -  cros-ec node like google,cros-ec-spi.
> > +  control the Type C ports. This binding is compatible with both the
> > +  cros-ec-typec and cros-ec-ucsi drivers. The cros-ec-typec driver
> > +  supports the host command interface used by the Chrome OS EC with a
> > +  built-in Type-C port manager and external Type-C Port Controller
> > +  (TCPC). The cros-ec-ucsi driver supports the USB Type-C Connector
> > +  System Software (UCSI) interface used by the Chrome OS EC when the
> > +  platform has a separate power delivery controller (PDC). The node fo=
r
> > +  this device should be under a cros-ec node like google,cros-ec-spi.
> >
> >  properties:
> >    compatible:
> > -    const: google,cros-ec-typec
> > +    enum:
> > +      - google,cros-ec-typec
> > +      - google,cros-ec-ucsi
> >
> >    '#address-cells':
> >      const: 1
> > --
> > 2.51.0.858.gf9c4a03a3a-goog
> >

Reviewed-by: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
