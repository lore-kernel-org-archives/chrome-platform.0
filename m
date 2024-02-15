Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF35833D1
	for <chrome-platform@lists.linux.dev>; Thu, 15 Feb 2024 00:10:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707955840; cv=none; b=uGpHdgmraWhrQ5XNfz0sQbEmyhbmvDUgTFJsN3aA2m7S5cjCL2bfYClUZvC3zMzGZN9QHWLRRUAZ/G+eLchbnhvlvoFl5U+YClBdsry66xgpQHE5KrKP7u50WJtK1aKEPvpupOK9bCj8Ifaw0Pvdoo9HZCSvLnPETU6ohvwqhEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707955840; c=relaxed/simple;
	bh=MoY8zd5LHcnN/kn1Yc6yYVDv8A/j96P+/bHPEamCQx4=;
	h=MIME-Version:In-Reply-To:References:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jFjriB+NoYQxlFoQWwRen7FkqqIdq+8ltTzUprYBx0xf0euaTjZ63C/hHewwYWaC1YnWG2i12YC4btXjXL7dVcRJX8dCESTkMmJiycdv4pQOhoRRyGno5GUlxjywO6mjmBjQEk593bQJkj6pY/FAY1ycRA8XVDpYQaKY31h6zoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=H2aojETz; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="H2aojETz"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5114b2b3b73so362415e87.0
        for <chrome-platform@lists.linux.dev>; Wed, 14 Feb 2024 16:10:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1707955837; x=1708560637; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:user-agent
         :from:references:in-reply-to:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MoY8zd5LHcnN/kn1Yc6yYVDv8A/j96P+/bHPEamCQx4=;
        b=H2aojETzRj7zcwLHD4J4TQ4+uSy10BdF8hCFCyeKZV44WiiM2ziNeJ+Hhimzi2UOAw
         1hZOx1D12tV17sHEq6fVEbAKi2tAlQO8pPSvLFtiwDgBlVRkb+p6IVrBAUcWSjjKQpA1
         DP8ZCDEpfkk2xwYJrmS9pcLkUt5g8kn/K4NUc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707955837; x=1708560637;
        h=content-transfer-encoding:cc:to:subject:message-id:date:user-agent
         :from:references:in-reply-to:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MoY8zd5LHcnN/kn1Yc6yYVDv8A/j96P+/bHPEamCQx4=;
        b=kQyYUwPNvREjt5E+/Hb6roAen3OxGVQ49c+x/UBbMOB3a9gnDZvb6hWuF9sLime682
         SHij6ojOn4SD7BI9wpPj6yJUpvxmSoVdkDUErjR/6h7gbn1J1GWUVJ6lgKXFNrCK2rDH
         I8rvboEUWoBnlHP+Pi9+RGsWosiXQ6P4P8hpcz17i8M6XRO9rhh5jclAMtOss6SZOBYI
         gaIeH17eT40HA54fYWyyws4RBK/La06ghFCyw8BRAXXrI5ggsjDQT4vqko5lU3rtnzI7
         dJliHJuGgIqRYpDS8U4c5rRzKTytsMVvWui7drT8JFdTX3Hvavza9udYPQUwS1tOLxtW
         wVqQ==
X-Gm-Message-State: AOJu0YwuIklhRkYjhnysMFpR6PcOtz8g5P0AquUPXq+ehFpYR6ih0Yc6
	T/aE0uUOkfJIvMiJZ84yTNvhL0No6eIOqr7OJR9G0n65m7GlpWnMV4k0luaF4E4mbxNqjxA+xMM
	ascfFGwU2tdaULLMgIFVfXs0uwspiikkBSWWB
X-Google-Smtp-Source: AGHT+IGyK/V+b6ReG/wqHqXSPazELs/LPvoaEiaFNzPjPQahgGbt5hpPQ9anxbvIUKEHmI0AXlLFR3H6hDqkCDMBBq0=
X-Received: by 2002:a05:6512:3584:b0:511:ab1b:1db9 with SMTP id
 m4-20020a056512358400b00511ab1b1db9mr212121lfr.33.1707955836868; Wed, 14 Feb
 2024 16:10:36 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 14 Feb 2024 16:10:36 -0800
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <CAD=FV=WE4bgwTWTKjPbQR9RCt-SEVZXfQtXoaXAjvTiZiMr=wA@mail.gmail.com>
References: <20240210070934.2549994-1-swboyd@chromium.org> <20240210070934.2549994-19-swboyd@chromium.org>
 <CAD=FV=WE4bgwTWTKjPbQR9RCt-SEVZXfQtXoaXAjvTiZiMr=wA@mail.gmail.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Wed, 14 Feb 2024 16:10:36 -0800
Message-ID: <CAE-0n53H-WPSr4tnmjq2Z54daKYD3PPzmxy28GsYAd29MTXiWA@mail.gmail.com>
Subject: Re: [PATCH 18/22] dt-bindings: chrome: Add binding for ChromeOS Pogo
 pin connector
To: Doug Anderson <dianders@chromium.org>
Cc: chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org, 
	patches@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	Pin-yen Lin <treapking@chromium.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Quoting Doug Anderson (2024-02-13 17:17:34)
> Hi,
>
> On Fri, Feb 9, 2024 at 11:10=E2=80=AFPM Stephen Boyd <swboyd@chromium.org=
> wrote:
> >
> > Describe the set of pins used to connect the detachable keyboard on
> > detachable ChromeOS devices. The set of pins is called the "pogo pins".
> > It's basically USB 2.0 with an extra pin for base detection. We expect
> > to find a keyboard on the other side of this connector with a specific
> > vid/pid, so describe that as a child device at the port of the usb
> > device connected upstream.
>
> Can you remind me what the side effects would be if a different
> VID/PID shows up there? I know it's not an end-user scenario, but I
> have a pre-production "coachz" keyboard that's actually programmed
> incorrectly and shows up as the wrong PID. Presumably I could either
> throw the old hardware away or figure out a way to re-program it and
> it's really not a big deal, but just curious what happens...

As far as I know nothing happens besides ChromeOS userspace treats the
keyboard as "external" so things like smarter base detection, e.g.
wraparound keyboard detection or kickstand mode, may not work. I think
you get a popup box telling you the keyboard isn't the trusted one.
