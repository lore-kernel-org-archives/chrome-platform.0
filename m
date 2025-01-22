Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AA6021129B
	for <chrome-platform@lists.linux.dev>; Wed, 22 Jan 2025 11:01:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737543717; cv=none; b=W/Ltj5unn0xXZeTMkjBwI2tEV4hf3/pgFlhFLYAeQdcM0ciUJcuEr4mS07UPFvySG1rlbHk9ExjCVw2dRgd+dTMIaUl4mkYWRduIkXA+3RJH9eiPmJynPx1+lauBk+BOPbi/b7nqvf0QqXR1B2iuAPv4wKATXSi5xcg+KjGLZrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737543717; c=relaxed/simple;
	bh=ahegWa745mU+Vmqnh+ev9dNyAQR5ZkIBYktO62Z+AZk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ppkogTD7unLoXy5r08UMFgWnP3vjgHZwUHQIO5OJXQh+qS1q/b5JmpRVS3G5wPo98ffDc/pfp2EbyHvqpkikZvnw1SJFtjnM7s63AvXnOxEBAzm3DztezPGBkKc1Ge4O2Z5Go4kFaYhUIUqYu09Suyd/+JQlOJFpxaYzr7dhLA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BnjD3SeP; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BnjD3SeP"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-2ee709715d9so9396133a91.3
        for <chrome-platform@lists.linux.dev>; Wed, 22 Jan 2025 03:01:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737543716; x=1738148516; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ahegWa745mU+Vmqnh+ev9dNyAQR5ZkIBYktO62Z+AZk=;
        b=BnjD3SePxirYFgzNN/eern8uQj0pCSTu0/srZNo6+db69hUQ205hjVvOj160dwm9L7
         lH/T8WPp1EgwX3lRV8CZPnKK1pOSQ3UQ+zcEzhY+fYjQug38oKDcDGqCvRxhJg90PGz+
         9pep3+7uk00AisqW74JaitwUc6RlYK8HsdnhoFdAUJffSO9/EMlyB/EzIH+HoNwABmVk
         gVpnMVRHxBu998vIohCS7CNtuXxPFjzqpZjPxPsEyMlPlH+RBUUmC21LdRxu2r+kTBJj
         FfaHUWkq6N1p7pwMXtvXnwG+PEKgMrl4RCE9I06ywmzv7PMxL/UyCc3hGXyW7X9xSQ4X
         AbOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737543716; x=1738148516;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ahegWa745mU+Vmqnh+ev9dNyAQR5ZkIBYktO62Z+AZk=;
        b=WSNLHPT4zjlhzEy44w+tWGUmVrX5JCcie7UN6l343m06sC4Ov9IDhUKKsyFjXthEKG
         HxEGnfnXN3ft2qC5/LEF3d6BsdRCTip8WiLVpBaXJDZm8CZ7YKUBWDmVovgunQZSuLX6
         cIwDmxKxUFuoaSSqH/f3R24O7Lvj46lZ2XFPlnKY5Rv5mangE6pMFKz0A5F6rOJE7NZr
         +GcwGXdXLxvQ/B/euMc+4hshW8GmIcUeiMQ3Lmkl55O4zukAewXlow+jyPFDtJC5x/my
         Jrx03osycNdWhjtP81zPc/yqBMzzWmcTrNLY65093DbO37OA3yWulrfaC8+DIKM8aXDA
         /WAw==
X-Forwarded-Encrypted: i=1; AJvYcCVEHteKh4WjkuvHCzyXllm3qCyVnArQ7hNuHhBK7bsDRBXIS8cHtDPjTujlSiev97OW3pTiyYE4lb7pq1BHG38=@lists.linux.dev
X-Gm-Message-State: AOJu0YzDI0j8BGY4UExcyBXIoWhYiaKvb7u1aRj6iiswyU9qTHdINGkK
	fRGeGFx5Z3jy4ePegIRa1Vw/DpkED8EQKGBkQevjjzEzvoPkV2QMecUM04pZ/LHz3sD0BdnvLOh
	GPew31vnNlSezzBtprpU6mJhS/6A=
X-Gm-Gg: ASbGncuS1xQIUtAXnvbT9l77oy8odTz8q33/6mVOai2GfrGewdD8bhbkK62gSJnSIkY
	Pu/eWg0s8oq5hb6bFe5O1JUSudRuf0UqGln7OpvVP+qbqOuC1Q6e2
X-Google-Smtp-Source: AGHT+IFPgblVHaEjnM6nhcreTldchYyIJTpY55eKVObaVzFagqAwIyDjIvNPwSyVAwhYwCsUN6FF7RqNwMBujjZOwbw=
X-Received: by 2002:a17:90b:51ca:b0:2ee:5bc9:75c7 with SMTP id
 98e67ed59e1d1-2f782c4bdc3mr26294095a91.5.1737543715747; Wed, 22 Jan 2025
 03:01:55 -0800 (PST)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250113-hw_protection-reboot-v2-0-161d3fc734f0@pengutronix.de> <20250113-hw_protection-reboot-v2-3-161d3fc734f0@pengutronix.de>
In-Reply-To: <20250113-hw_protection-reboot-v2-3-161d3fc734f0@pengutronix.de>
From: Matti Vaittinen <mazziesaccount@gmail.com>
Date: Wed, 22 Jan 2025 13:01:43 +0200
X-Gm-Features: AbW1kvYA1CSvpEvQV0avkVcXZAcP3BsGSp9Mve19t_aSvzY4TVkLSF5gkliB-RI
Message-ID: <CANhJrGM=DHmXxKrfwQ80-6wqZqMLx7Yv=jC0ZV0B9D92FAcd6A@mail.gmail.com>
Subject: Re: [PATCH v2 03/12] docs: thermal: sync hardware protection doc with code
To: Ahmad Fatoum <a.fatoum@pengutronix.de>
Cc: Andrew Morton <akpm@linux-foundation.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Fabio Estevam <festevam@denx.de>, "Rafael J. Wysocki" <rafael@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
	Lukasz Luba <lukasz.luba@arm.com>, Jonathan Corbet <corbet@lwn.net>, Serge Hallyn <serge@hallyn.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, 
	Guenter Roeck <groeck@chromium.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-security-module@vger.kernel.org, chrome-platform@lists.linux.dev, 
	devicetree@vger.kernel.org, kernel@pengutronix.de
Content-Type: text/plain; charset="UTF-8"

ma 13.1.2025 klo 18.26 Ahmad Fatoum (a.fatoum@pengutronix.de) kirjoitti:
>
> Originally, the thermal framework's only hardware protection action was
> to trigger a shutdown. This has been changed a little over a year ago to
> also support rebooting as alternative hardware protection action.
>
> Update the documentation to reflect this.
>
> Fixes: 62e79e38b257 ("thermal/thermal_of: Allow rebooting after critical temp")
> Signed-off-by: Ahmad Fatoum <a.fatoum@pengutronix.de>

Reviewed-by: Matti Vaittinen <mazziesaccount@gmail.com>

Matti Vaittinen
Linux kernel developer at ROHM Semiconductors
Oulu Finland

~~ When things go utterly wrong vim users can always type :help! ~~
