Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DA0DD51A
	for <chrome-platform@lists.linux.dev>; Fri, 19 Jan 2024 08:36:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705653388; cv=none; b=ayYew19VmD4L9H8r8jZHT1O8jnq4AGfkFCLAjB7XoEe4I0CetavGl3ClKEfs1agDf24ZyON9cSjPZGe0vEIik+HyZPH0+P/vUyPQwyAUWLiJIoDZ+izfafNxkJEjLjiMEY3moSUZ7Ak3iGvPIEqullVOSEYI+E0aKzJaQvSDm/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705653388; c=relaxed/simple;
	bh=gqJH+Q3N0WE/KAJXf+jqZvwxlUI54xxzFE43xBViHto=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NzuneaFnMrwwuXdXqHr8wI+OqQxRk+EoicAv+0qCmDpNbm4/WMXw172E5gNUwPwRlusAj6woEtZmJp0boH21/1037eijWHhu+sFF5nZ9NrxvRmlk81YG5N0lGW6B9W0cSe7kgx0v8R7nug91K0rewy9GqjDx7P8oJZgENDxnFlA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=AUdCPqHY; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="AUdCPqHY"
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2ccec119587so6927441fa.0
        for <chrome-platform@lists.linux.dev>; Fri, 19 Jan 2024 00:36:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1705653383; x=1706258183; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=gqJH+Q3N0WE/KAJXf+jqZvwxlUI54xxzFE43xBViHto=;
        b=AUdCPqHYiCqTeLxiLbvj6K48Otsub8zJvSxt4cQdJT7m/Bw1gHdu2rFvz4PhrXmmRw
         3MB7aP28EzX4fw8jQohkKlP1zZdSEO6sRw0h0FY3uu8Sw+ZFP2zkuG9sDs3qqlLe69Qc
         BPk1pezU9maRYd8Bf2Gqq2BzXpt3DUZ3J9Htc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705653383; x=1706258183;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gqJH+Q3N0WE/KAJXf+jqZvwxlUI54xxzFE43xBViHto=;
        b=lug76DcfBOgXPEgfDgud7AGTkvPcqBjFr5H0nhWtb8eir7LZsCVP2rGdhQplCzWtk4
         vv6Dx7nyLFgRGj/sOcKOPHZdtK6CxE6pnJwc3y8HFMVJ7wYlYKqEQ2OH2req5z6tXbOW
         4JhXkx1gq8BmEpILyWuez1EwfVssbVgBMuSKiIqM+Zji8ZQaXAobVS8aI3HZEmRCKRxr
         7wc1gi8O2GBVV6L7Sb0LQBSgtl64lpKuJPZZVq/8XzvSKhNseiId7Q7Q7gVm+rVo3Rnf
         W4BOi4qgvTxCfqqSJ27KzxrAVREkZG2wisBR7RlUHCvuSruuQsXoGyZS0ZQVPo4pVPyi
         7q5g==
X-Gm-Message-State: AOJu0Yz/M7T6/Tav/d6ya2enJtEWCC+akSgxv0TkjGhBcjuS0na+90Z1
	DnnqWqDfZbfqZWqqQ6UOXyaukxUVY52vWZcgRvgpC+pZxuwkJ8gjoxyPd3Lc13Tn/FtF+Rdi4U0
	Ub0RugH3XyWi4bBCdpx0wpwTsCfUaCmRwGuxF
X-Google-Smtp-Source: AGHT+IH4bVEhLEi75Db43ItzAD8XcRylKzUeEaDfyXD/kUVcUWrY1OcFmcof4B2w+mM/L10iyzCfvsBqk2QLZ0VxLPc=
X-Received: by 2002:a2e:b707:0:b0:2cd:36ff:4d7d with SMTP id
 j7-20020a2eb707000000b002cd36ff4d7dmr1397341ljo.12.1705653383174; Fri, 19 Jan
 2024 00:36:23 -0800 (PST)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240118195325.2964918-1-lma@chromium.org> <20240118195325.2964918-4-lma@chromium.org>
 <afc0a32f-4352-4ce7-a57d-9c5900ba91d1@roeck-us.net>
In-Reply-To: <afc0a32f-4352-4ce7-a57d-9c5900ba91d1@roeck-us.net>
From: =?UTF-8?Q?=C5=81ukasz_Majczak?= <lma@chromium.org>
Date: Fri, 19 Jan 2024 09:36:12 +0100
Message-ID: <CAE5UKNqz27LMTyiRBxQCwmeDCMEtQBPdUTWKQ2HOTxPqFU9ODQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] mfd: cros_ec: Register EC-based watchdog subdevice
To: Guenter Roeck <linux@roeck-us.net>
Cc: Gwendal Grignou <gwendal@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, 
	Radoslaw Biernacki <biernacki@google.com>, Wim Van Sebroeck <wim@linux-watchdog.org>, 
	Lee Jones <lee@kernel.org>, Benson Leung <bleung@chromium.org>, 
	Guenter Roeck <groeck@chromium.org>, Krzysztof Kozlowski <krzk@kernel.org>, linux-watchdog@vger.kernel.org, 
	linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

> Assuming you drop "-drv",
>
> Reviewed-by: Guenter Roeck <linux@roeck-us.net>
>
> Thanks,
> Guenter

I will do so, thank you.

Best regards,
Lukasz
