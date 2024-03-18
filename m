Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41C2F58ADE
	for <chrome-platform@lists.linux.dev>; Mon, 18 Mar 2024 21:36:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710797785; cv=none; b=NVwcG8eZ3FOVDJuVDX+stJ8FKd4Uifa8tWIoxoxOrysZRRnMN5lm5bVJ9ea7oAQxc/SKjNt7WpAEGWMkh+/8Ldr2UGZBdxxCy6qgEKxsypACBFBUTwf1GGqXmtZjkwr9gU1ULMZIlldgNHqwzf+GSQ4/hyf5bSzygtTtPsF3ISw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710797785; c=relaxed/simple;
	bh=oN3ajsjXsAF9HfH4yepxydlxom6CmZW2+KuqWPApvOc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RyXq8cFAllFN8mX5GnXF/8Wfv5OGG1zvYm6TGRYv9yPGRbQcWo12kjAvdrDLSwvpUYmzx9EQMJdWGSwaNWN8W9wLHGnwMISjN26amgYf5S4Qy+yBBZe4tLNnu24d8yhDa17TlpB7qReZXW3TMY3QJUw5WTPdBhLMjijfNKXwyDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=IAzG7qv4; arc=none smtp.client-ip=209.85.222.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="IAzG7qv4"
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-789e6ceaff1so290257685a.0
        for <chrome-platform@lists.linux.dev>; Mon, 18 Mar 2024 14:36:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1710797783; x=1711402583; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oN3ajsjXsAF9HfH4yepxydlxom6CmZW2+KuqWPApvOc=;
        b=IAzG7qv4KXtG4myGvwV6DjDdQ5hN9SqJQjVST6UG1kd2zsB0R9Ol66bRhmTJnUo4E/
         gX1D6Wm4MHhi0GN6MIAI2FCotmYiMcLu5NsVNrX3aprm/KyP+KA6PehpIgwfq5QB/W3+
         SiJlt4Nf9brlIw/A/9PoOuzOdvZeatq5fg/o0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710797783; x=1711402583;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oN3ajsjXsAF9HfH4yepxydlxom6CmZW2+KuqWPApvOc=;
        b=qs2B8XJUJLnuyffEWc+EJe/h9JUgpkLN7AQRtIGX2MDVvQh87AOInnlDS6/T/Z2Gjs
         gzv+xgGybCkY/Lw7mpLxLXri+BDSLlCn3kj9f7mQsYpw3QbP4PgMTcOgHji/ELITlvEX
         QtlagOzSu5gDMsFqgWzoi8GtvTPtsAQR8IsjP/Hx7XftdFKaQxSX4mq4J6Hu2hKPfpG2
         k7dN+zHa8VrHg30IBmyI58ilGTmSQfeBBdPIv/rb69IQzKW+bbVfAOtgkovIW0b9Iz8s
         kz23eVrd0GUgexnWQDB4c/Px/NsRx3gTjOC+tPfIuiBMhHJ9diijMEL6zujY8/sqCOBY
         pjpw==
X-Forwarded-Encrypted: i=1; AJvYcCWWW7A6NLcSeng1OdbzdTk4StMl6Qko/+eiReDPdbsZOTsqpS++S7zzi1MKudJvZ96c6tdD8F0DZkHQ6I6boal7GnZ6w3gLMYWAL+k7Jwb8
X-Gm-Message-State: AOJu0Ywinn/H/cmkN/Ab8xpWfFZsX8uwHoDTzTZJxuAcbhMkhlsgLqr/
	C8YOJL3uVKgDxT23pcPQxrhtJvUVt+EJT5ywUHPchpcKl3BRIzoIHyOUZbijEe2aSNEDtLQX2mY
	=
X-Google-Smtp-Source: AGHT+IF7c7LfepaPwGPZeOigxyuQnfAAe+yKZMyvBxG4g/l56oXYe5R5nmN9Xvxm/0EJpiiTRth8SQ==
X-Received: by 2002:a05:620a:4101:b0:789:cb7b:89af with SMTP id j1-20020a05620a410100b00789cb7b89afmr1593868qko.24.1710797783258;
        Mon, 18 Mar 2024 14:36:23 -0700 (PDT)
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com. [209.85.160.177])
        by smtp.gmail.com with ESMTPSA id y1-20020ae9f401000000b00789ed16d039sm2536084qkl.54.2024.03.18.14.36.22
        for <chrome-platform@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Mar 2024 14:36:23 -0700 (PDT)
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-428405a0205so38531cf.1
        for <chrome-platform@lists.linux.dev>; Mon, 18 Mar 2024 14:36:22 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWoij+NSFqVhfNaVycZErOmiwYh9ROdhB56Dkfse0Vo7XMfqoW6xGSS9N+I20L7CyjYSBFr7wDP7QGxOBLf9RvaIOznyECL1fu6zLsVhdoW
X-Received: by 2002:a05:622a:50e:b0:430:b590:e88c with SMTP id
 l14-20020a05622a050e00b00430b590e88cmr111577qtx.6.1710797782513; Mon, 18 Mar
 2024 14:36:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <1710418312-6559-1-git-send-email-quic_amrianan@quicinc.com>
 <1710418312-6559-3-git-send-email-quic_amrianan@quicinc.com>
 <f6f317d9-830d-4c38-998f-b229b3d9f95a@linaro.org> <20240316-germinate-browsing-6865db3a44d7@spud>
 <20240316-herring-skies-6ee1d4a9c0d2@spud>
In-Reply-To: <20240316-herring-skies-6ee1d4a9c0d2@spud>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 18 Mar 2024 14:36:06 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VZB9Dqsw6+2WBdWxaQVA9NgK_W2n0okBOU0haDMSogPw@mail.gmail.com>
Message-ID: <CAD=FV=VZB9Dqsw6+2WBdWxaQVA9NgK_W2n0okBOU0haDMSogPw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] dt-bindings: qcom: Update DT bindings for multiple DT
To: Conor Dooley <conor@kernel.org>
Cc: Caleb Connolly <caleb.connolly@linaro.org>, Amrit Anand <quic_amrianan@quicinc.com>, 
	robh@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
	agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, kernel@quicinc.com, peter.griffin@linaro.org, 
	linux-riscv@lists.infradead.org, chrome-platform@lists.linux.dev, 
	linux-mediatek@lists.infradead.org, Simon Glass <sjg@chromium.org>, 
	Chen-Yu Tsai <wenst@chromium.org>, Julius Werner <jwerner@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Sat, Mar 16, 2024 at 9:51=E2=80=AFAM Conor Dooley <conor@kernel.org> wro=
te:
>
> On Sat, Mar 16, 2024 at 04:20:03PM +0000, Conor Dooley wrote:
> > On Thu, Mar 14, 2024 at 02:20:38PM +0000, Caleb Connolly wrote:
> > > On 14/03/2024 12:11, Amrit Anand wrote:
> > > 2. A top level board-id property that isn't namespaced implies that i=
t
> > > isn't vendor specific, but the proposed implementation doesn't even
> > > pretend to be vendor agnostic.
> >
> > I pointed out previously that the Chromebook guys had some similar
> > issues with dtb selection when the OEM varies parts but there does not
> > seem to be any of them on CC here.
>
> That's maybe a bit harsh of me actually, I see that there's a
> chrome-platform address on CC, but I don't know if that's gonna reach
> the guys that work on these devices (Chen-Yu Tsai and Doug Anderson in
> particular).

Thanks for the CC. Yeah, I don't watch the "chrome-platform" list
myself, though maybe I should...

The Chromebook boot flow and how we've handled this so far is
documented in the kernel [1]. This method is what we've been using
(with slight modifications over the years) since the earlier ARM
Chromebooks and is, I believe, supported in both the depthcharge
loader (used in Chromebooks) and also in U-Boot, though it's possible
(?) that the U-Boot rules might vary ever so slightly. I haven't tried
using U-Boot to boot a Chromebook in years.

The current way things work for Chromebooks involves a heavy amount of
duplication. We bundle an entire "DTB" for every relevant
board/rev/sku combination even though many of those DTBs are 99% the
same as the other ones. The DTBs have been relatively small and we
compress them so this hasn't been a massive deal, but it's always been
on the TODO list to come up with a scheme to use DT overlays. We've
also talked about bundling a device tree that has the superset of
components and then using an in-kernel driver to set the status of
some components to okay and there is some overlap there in the
possible way to represent board variants. I think Chen-Yu is going to
talk about a few of these topics next month at EOSS [2].

In terms of looking at your specific proposal, it's definitely trying
to factor in a lot more things than the current one that Chromebooks
use. The Chromebook model was "simple" enough that we could just
leverage the compatible string, though the way we leverage it has
ended up controversial over the years. Yours is definitely too
complicated to work the same way. It seems like device tree overlays
would be a better fit? I'm not an expert so maybe this is already
solved somewhere, but I'd imagine the hard part is getting everyone to
agree on how to specify stuff in the DT overlay that allows the
bootloader to know whether to overlay it or not...

[1] https://docs.kernel.org/arch/arm/google/chromebook-boot-flow.html
[2] https://eoss24.sched.com/event/1aBGe/second-source-component-probing-on=
-device-tree-platforms-chen-yu-tsai-google-llc
