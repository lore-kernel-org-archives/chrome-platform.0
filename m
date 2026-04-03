Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4D2B311C35
	for <chrome-platform@lists.linux.dev>; Fri,  3 Apr 2026 14:22:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775226123; cv=pass; b=G/ToJNiD3KIFafjQj64UaBHnsBWLaHQiQAAYr682IbykVjaBiEXnqBHKgH3y/Yztxj0Cxy84FNjjHv5kDG7+1+s78Ai8RuE3E9c6n5zNSKPEdJjq6wl9If6qxChjEMdToZ3WDqn3KpuiqAmz4u/+8J2uoT3uKXELIKDonG1IC2c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775226123; c=relaxed/simple;
	bh=77Px9y3PACN7GbbO166UYs/MCsPCUymFm1lueR1C+IQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PNJa47SdD6OVmnCHeU+dKaWitn4kdNtM78riJbP7eRQVcLN4OhLgqgg8m0wsgrV5ormqy/kXRU6uzZmZ45V9b+iZxYqc4+zf5/r2PpVCngXLJTWq+UICZgq9h949JPjrquFpgJTP/zyhZcb6FQSbrteI4wZCCIkp8qfF/OG1EmQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=XwKrt9Ed; arc=pass smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="XwKrt9Ed"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-c06cb8004e8so737557a12.0
        for <chrome-platform@lists.linux.dev>; Fri, 03 Apr 2026 07:22:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775226121; cv=none;
        d=google.com; s=arc-20240605;
        b=VfTqtVqsSSgJkHjE/mnpSLcnfY6DlMnN/aOGNSvHn9bnETeCK8a63WdrWvoxxrIRaL
         4HdIcs2yE55WFYWn7o816Z67UVmas+Ap/41zlj4QBzD0ppYpPZ6rwgvI/SCJ0RnnsQR8
         w2OSks43RZOluOFX9+N2QcbdZ5Uxj7jUEQU7erWcke27YmD7J82RKxQ0yCoESS1eI5M3
         9q7O0oiDepK2H8EwLXYEnneRdzhXsrTZCxb/4XBvyXTAsW9tLv4iqJt3UrLW7bCf1SWL
         91ZM0ZIInwjssr4/pVVUVc3UlqGWvM/Enjmo0N+h7tl6CrZKv5WyvywJLcjfhVUJMtJy
         V7lA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0SBDyvGEKLO7ufOaCEX2OwvcXKCybxnjCOTqas4F1V4=;
        fh=Jsc6trT7XXGVT1SilpSRvubLbRC7hRr5C47cGxsu2zM=;
        b=OemfFT11FwQrL1pp1viVBQ/ebXwxcE24lrBF3J34rAUONHRbzgnYJkvW7EYhEKJWVo
         vyHq0ua/5dfc3poHKRvRBeAeRd8kBy6h67Mk6Rqom37MppYcDnDE4q4KcO14ucjIfPrk
         R6K90QbcrH740qE2eYEoqigE3ChsmOYiAdqElrN1vMWdfncpaC92Py0noChNFtkQr18L
         ZkZrC83zbN2qYYjj3Pt1phr1fU59S1SnTf+xHaId+CXYJVCo+lEReMM6grvFSMoU/9wk
         tWKs53m6jGKznWAa0GUlLLL/E8OoQM6CFjLqgEiKPQWFhABGzM5ZXwttObPXDpoHy1ZI
         ig7w==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1775226121; x=1775830921; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0SBDyvGEKLO7ufOaCEX2OwvcXKCybxnjCOTqas4F1V4=;
        b=XwKrt9EdheWwvTvNoRgkv7GY4fUslf//kqcMu7mbtOrYIW4Ts118XEUvrmWLZkKuju
         J0hAUDf1shQAdpCmQQtIJ9LRol7oTzY4eqro8UTUUelYdHn6GLzJSJQTfhpzpSVQgL8+
         F+kbUjzZrvw18wzr15C7wYeSt3YfVH4LnmjLk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775226121; x=1775830921;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0SBDyvGEKLO7ufOaCEX2OwvcXKCybxnjCOTqas4F1V4=;
        b=BbbvXaFvZPM2EzYDJFCIduBKYSTYrFRClNetv1eJc3V3W79k4V6MCNKlm8ny3QU2AW
         omc/mtpd3sypqvw6nVYovODH6CEdRLxgRDKOILDsksa5IKknH0lf2T8Rljn+QoAl8RuL
         hzcexMgf1Rr8lId55qzoy3QVd5WhhP8Mwtgvf0yCRF5FFGLIhAR2syeuCLhixwroEbk7
         qGlLwg7ynKw0+Gzoo7YqpUkENMeiGus7pShOHP7HWKeelfaGoB0kODLhBVxncjPLhNVM
         CpMJNZNSvyy34OydUK2c6OGjVB2rYpkepXgeP3PSi1mdfLUGGRG5bYBKE1POvtsW/R8a
         jHTw==
X-Forwarded-Encrypted: i=1; AJvYcCV/bRJKEi+AB1BOBmRDZiRL4KR4P+oxWdnNJMLN664LGAVAakkb/T8Lr00hRAPZXr7wvJ1K9p39BC3Mdvd2+xA=@lists.linux.dev
X-Gm-Message-State: AOJu0YysRR1imMymerroD4D9i6o4NvujdFzy5zBSZbLClHv6GAPLHQoo
	zZoZlxttLY/X07eFSfZ2XQEIkC+rwYY/zmWUogBKsipDknByzCNsRm5DhysG2azA9KS8ZZb6luJ
	Dtf3PUZDXHF8pnRZf7c+iG/sqO2kof2sUkGwHO7B6
X-Gm-Gg: ATEYQzwxSZhckC12Uv0RqR6RMg9Z0a61B8cReoqXm+Bzp8JnOmfr4VwcIU1cZc3xouP
	SNrQeIH9+aT7CC6WOD6hzV9Q4hHhVSp0m7ESF14NG9Qvr+Qicunomzyy9/xSCdh88HQqlgYyQTD
	xIjA5Sstg2h7EMzkK/+4cjxIIL8n8NoxoqdZHd0GALolVBHapNNiHps7K5X5Au1L7CE64/J5iFZ
	9mQWxoFPOsVoP57kWklbTIr1GyJtrboPl5o+rpwFHrqPsUPDTKBpxZTTayRYbaEemoG9Cbbeu1z
	D8GNeKpYjw+QYiiixob4d3Suub5gpZs58g==
X-Received: by 2002:a05:6a20:7f98:b0:38b:de3d:d542 with SMTP id
 adf61e73a8af0-39f2f268bb9mr2972587637.51.1775226121067; Fri, 03 Apr 2026
 07:22:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260129131928.794768-1-akuchynski@chromium.org> <aXwk_wzeF9UPd5DK@google.com>
In-Reply-To: <aXwk_wzeF9UPd5DK@google.com>
From: Andrei Kuchynski <akuchynski@chromium.org>
Date: Fri, 3 Apr 2026 16:21:47 +0200
X-Gm-Features: AQROBzAJfqjnW-bOF5FhBzlaH24H_Se_0hBnk18YrH8MKbbHscp45DnbUvsgS2Y
Message-ID: <CAMMMRMd_S2rk8WL+8ppDY0di8i6_3+ET9Hb3jC-Gm955RBRS2A@mail.gmail.com>
Subject: Re: [PATCH 1/2] platform/chrome: cros_ec_typec: Enforce
 priority-based mode selection
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Jameson Thies <jthies@google.com>, Benson Leung <bleung@chromium.org>, 
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 30, 2026 at 4:27=E2=80=AFAM Tzung-Bi Shih <tzungbi@kernel.org> =
wrote:
>
> On Thu, Jan 29, 2026 at 01:19:27PM +0000, Andrei Kuchynski wrote:
> > The driver sets mode_selection bit for each Alternate mode, thereby
> > preventing individual altmode drivers from activating their respective
> > modes.
> > Once the registration of all Alternate Modes is complete, the driver
> > verifies if USB4 mode is supported by both the port and the partner and
> > activates USB4 mode. In cases where USB4 is not supported, the driver
> > invokes typec_mode_selection_start to initiate the mode selection proce=
ss
> > based on mode priorities.
> > The driver communicates the current Type-C mode to the mode selection
> > process via typec_altmode_state_update.
>
> I find the message doesn't help me too much for understanding the patch.
> Can you rephrase them and assuming readers might not have too much contex=
t?
>

This patch is part of a larger series introducing the USB Type-C Mode
Selection feature. The goal is to allow the kernel to manage and negotiate
specific functional modes (like DisplayPort or Thunderbolt).
https://lore.kernel.org/all/20260119131824.2529334-1-akuchynski@chromium.or=
g/
Apologies, I should have included the cover letter; it can be found at the
link provided above. The series implements the mode selection feature and
UCSI support.
These specific patches provide the necessary support for cros_ec_typec.

> > ---
> >  drivers/platform/chrome/cros_ec_typec.c      | 39 +++++++++++++++++++-
> >  drivers/platform/chrome/cros_typec_altmode.c |  8 +++-
> >  2 files changed, 44 insertions(+), 3 deletions(-)
>
> The patch uses some exported symbols which aren't yet in upstream
> (drivers/usb/typec/mode_selection.c).  Ideally, you should mention that i=
n
> either cover letter or note after "---".
>

I should have included that detail. The mode selection feature is now
integrated into the core from the main repository.

> > +/* Delay between mode entry/exit attempts, ms */
> > +static const unsigned int mode_selection_delay =3D 1000;
> > +/* Timeout for a mode entry attempt, ms */
> > +static const unsigned int mode_selection_timeout =3D 4000;
>
> The commit message probably needs some description about why these values=
.

These values match the UCSI implementation. The timeouts provide the EC
enough time to complete previous operations; they aren't mathematically
derived but based on test experience. We've tested them for six months and
haven't seen any reason to change.

Thank you for the review!
Andrei
