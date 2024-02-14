Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E0CE5EE78
	for <chrome-platform@lists.linux.dev>; Wed, 14 Feb 2024 18:12:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707934327; cv=none; b=PjzZgAWvyc6Jdpb/ybk7lMGA0WRSvmFH9wVJd7lS2Bv8HN+r+cEKcSPYhxTOI0rGLGhFcr3xx/4KUARA6Eawh6zYjHtP7OFMy+P8w0Ht86BjiXwZjqVvNsIo5SATiyFI8muVLI8BAezaEpu6OG+CTpNbuOIepSJbyxBs/EVhnmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707934327; c=relaxed/simple;
	bh=OE9ONYhRtt1RT9UxYhOGWQZAzy9csxc4vRQdMTFcZmE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RS59mGXeskwdyfRFKRzPkbfQrqBEbJ2+wiS8vy1su6aiB7qOBAj6xIwXi7mcsxo2ujd+vOUao/kQQgSqP/1iu9v9+po1BTm3M5UWUelzBputFgborAjmZxDD7Q4LvmO1TERB9bC1ahMwYrBWWWD/Cz6XB8Z0KD9/JLYj+KAG394=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=UnynPLhc; arc=none smtp.client-ip=209.85.219.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="UnynPLhc"
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-68d0bcb4a46so387776d6.1
        for <chrome-platform@lists.linux.dev>; Wed, 14 Feb 2024 10:12:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1707934325; x=1708539125; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OE9ONYhRtt1RT9UxYhOGWQZAzy9csxc4vRQdMTFcZmE=;
        b=UnynPLhcpQurDm4Yt9gRLVAC+zhXB2eN+G6RM4cJPGSSjlwfZtnMVbrqwXGZwoP9Ih
         SJUw3Nto8rBgiBC+PEWjNzK6y8G7KXT272EobguWvKzbDB/U7P/LnF9UF3yETP2i29EF
         tqFPXiwHvcuGYzDlfDzoIaWlcJ2YnsVRSoNHE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707934325; x=1708539125;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OE9ONYhRtt1RT9UxYhOGWQZAzy9csxc4vRQdMTFcZmE=;
        b=A7P0zmUn1ptarmpRm8blRsSS7SZNcFvT/Z+kplJwBu9YmPMlTOj2krKf6zNavc310z
         qk6V82HHX+5X93vwHm1OB2DOEwocbe/w7FIOdno4yxpm47NGzyGV7moJCXI7a2H43axo
         w4ESkF15pyRyfdWo88jmAj0bGxIkGcZ8GukoN5QUNUJcX0MfsA1jiJlFxmP47XxcpcIm
         qz0Q8U9rrdf1Q2wa1mj40WI9UrQP8QCXQgB61sc4xnjqbi3M24lhYpP4xtprinpS07tS
         6cqlLyurnfiSi0Diyeg5QrcbYbjspADGCXjIHpqn3fz9DGEgyPlsJ51k8dgRhkENh+bq
         Ni7A==
X-Forwarded-Encrypted: i=1; AJvYcCUFrA53Rh6ZFLymIeW+Uth7JZ8+BhRW5mBGYGgtJrIxf9dovE/cra46VPbIefmgvRM9ywMa3Nc7spH/ci4F3Y3fHIlPl6bwxbr/5G/wB1RE
X-Gm-Message-State: AOJu0YzLbeKRRYWGznw8D6txwA1gEZiC0j5mp/NSJGXjghjPE5OWzslN
	Zi67029yH81qSP1RTGeTlJTEOcUCxETy/XvVxWLA1b2xqRWQgrZv/nDQ8Yf3BqrFwXjduAEKb5w
	zZ6if3N6X+/N/ZtYlpMnOIDbfWIeWBc8Ny0hn
X-Google-Smtp-Source: AGHT+IEgrWvxXcraQzc1baiUPwiEzauqEskx3AucYV5QX8er4b9bpYzTMRyz2B2QxRzh4QRdmPCoEcLyLXCe6Vd4YFM=
X-Received: by 2002:a05:6214:e82:b0:68c:da0a:10ef with SMTP id
 hf2-20020a0562140e8200b0068cda0a10efmr4022290qvb.57.1707934325206; Wed, 14
 Feb 2024 10:12:05 -0800 (PST)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240213130018.3029991-1-heikki.krogerus@linux.intel.com>
 <20240213130018.3029991-3-heikki.krogerus@linux.intel.com>
 <CACeCKadLKg89c8s68QD6VsqiKBMms6765O7mFFihqtET30pUyQ@mail.gmail.com>
 <ZcyUblecufzeso17@kuha.fi.intel.com> <CAAuZZi9h=d2_CM4tU4-H9wJfhLZbw99X2dGSddiCeDFDdb+kjw@mail.gmail.com>
 <ZcyrCosNDXxGZh9O@kuha.fi.intel.com>
In-Reply-To: <ZcyrCosNDXxGZh9O@kuha.fi.intel.com>
From: Prashant Malani <pmalani@chromium.org>
Date: Wed, 14 Feb 2024 10:11:53 -0800
Message-ID: <CACeCKacOFLKGCBTuFTVj+=W9C+rC++7DfzkG=M23i0Qh4qTOxA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] platform/chrome: cros_ec_typec: Make sure the USB
 role switch has PLD
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Emilie Roberts <hadrosaur@google.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, 
	Guenter Roeck <groeck@chromium.org>, "Nyman, Mathias" <mathias.nyman@intel.com>, 
	"Regupathy, Rajaram" <rajaram.regupathy@intel.com>, 
	"Radjacoumar, Shyam Sundar" <ssradjacoumar@google.com>, Samuel Jacob <samjaco@google.com>, 
	Uday Bhat <uday.m.bhat@intel.com>, linux-usb@vger.kernel.org, 
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Heikki,

On Wed, Feb 14, 2024 at 3:59=E2=80=AFAM Heikki Krogerus
<heikki.krogerus@linux.intel.com> wrote:
>
> Hi Emilie,
>
> On Wed, Feb 14, 2024 at 12:04:22PM +0100, Emilie Roberts wrote:
> > My understanding is that this is related to the wiring spec and not
> > ChromeOS specific. It seems possible that OEMs making non-ChromeOS devi=
ces
> > may have this same issue. Or are we certain that only Chromebooks will =
ever
> > see this?
>
> Non-ChromeOS platforms do not have this issue.
>
> The issue is with the ACPI tables - the USB role switch ACPI device
> nodes don't have the _PLD object on these systems. Ideally this could
> be fixed there by simply adding the _PLD to those ACPI device objects,
> but I understood that that is not an option.
>
> But maybe I misunderstood... Can the ACPI tables on these platforms
> still be updated?

Since it's just a _PLD update to, it should be possible to do a "light" fir=
mware
update on the relevant boards. Shyam/Emilie/Won, how practical is this?

I'd much prefer this to be fixed properly in the ACPI table than relying
on this quirk.

IAC, if we absolutely *have* to use this quirk:
Acked-by: Prashant Malani <pmalani@chromium.org>

Thanks,
