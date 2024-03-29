Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com [209.85.161.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D05B13CFA1
	for <chrome-platform@lists.linux.dev>; Fri, 29 Mar 2024 15:09:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711724942; cv=none; b=U3NLpP7twpO3NG9C9LmrlMy01ZgKU3KERUxDfYlp5amZKDhHwB4jFtajRgwd19aABXDzpDYO+hcuq86gTf/7WRMeYngmjqYzPbIyRd0Rv5A7N5ucBZNtaiIJrgAcLqoTGUdKo30eCstpk1nWW9ioIpY1SgrjI9CjVUR+zLGl7rM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711724942; c=relaxed/simple;
	bh=daePYgjkq+cQ2AzVZ2YunxMLLLX5go5iQcMTmOzir+k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=b1j2HiRlObqhahCA3VYanpIUV27k84ybOqwAIe/x/WSv4caoExSWAjWAnDtJZ1z0PDPZgx+Ym3FO0V+ic/k5e2Nd0fi8R5pZRsOr2octuieq6lEkW3kABDkwvzBPW8GoCmjoyZxxMOpXI9WXVETO349r+t/xKC6TBEExAhBpNio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=KLXYvE4H; arc=none smtp.client-ip=209.85.161.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="KLXYvE4H"
Received: by mail-oo1-f48.google.com with SMTP id 006d021491bc7-5a5508007fcso1031112eaf.2
        for <chrome-platform@lists.linux.dev>; Fri, 29 Mar 2024 08:09:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1711724940; x=1712329740; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=daePYgjkq+cQ2AzVZ2YunxMLLLX5go5iQcMTmOzir+k=;
        b=KLXYvE4HXr2xhh5whcKj9ngvrroG96JS845IeQjgoHNrMLBI7GQhDHWvhc1kgwhK2n
         6gCLGt8iJmBc9WAFelr6inSnSsvXCmr27VUEgIQsD9EOmB3LtER8zyt0MRcHsQt1wkWl
         7zQmt4SMLwTwsAk2SSyKqhn0b4ppf+qVnI++k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711724940; x=1712329740;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=daePYgjkq+cQ2AzVZ2YunxMLLLX5go5iQcMTmOzir+k=;
        b=ftGTpEi2rxdwv0UFwD3LGtZXyv6s797t7vmKlRjqlqX16gtFV/op0ur4zdJ/lXlRu2
         5mrqqsqc21L0E0UW40SLPHUoXQfgV8vcGzCBzf8wFZZowXZc1oiOmAS8xNxIiqFpJmv6
         1LTsjncKjOcVer+xAAQroRRcwZuguEXA3D+rDx0TJW1sxt9qjI2h8zoRpi//MlIesw7E
         gxtbnDhFRWqm7/J/5dMnIwmWG2fu4uVBglt9ql4oda4ZUpi8pGMDIgsPZQbktYiUFhP+
         76L008hd3UjsSsNGR5sWo2GHmuYtRfr+Eb573t1iAAcw/g9b2z62FrxfWdpxTZjGJJ3q
         vxYQ==
X-Forwarded-Encrypted: i=1; AJvYcCU9ufGocbUSwpSRU6HO8LoZq/eiET6nlQRQTlqCPE3PidXJ5T/N7SY/3aiMPfMW3eTol0xnY4B652p2Swchv5R3HAEhN+jl05K1SVSkC6zu
X-Gm-Message-State: AOJu0Yz45E9/QahgYDKdrp5B76mp10dqffsoCTc3V9V3HCxyDoaSSaTv
	j+RqtitFI3u7yIQ7uYTdDRz+OODzJugP1iHRq5BFE9TGmteSyyjmkNck6VZk5jfv1UtWwko8CTD
	6S7D8FP3219L2/x/XeVPoyjvX3dy+y5OU0mHkl/WsUl5BWF8=
X-Google-Smtp-Source: AGHT+IHkCQP3YZsgrbXv26rrddE1rn42JrcOzPiLaSGOjMcGGGjCzEJoZhIHs5VGpIwznGGn1zH7hw2r9eb8NNiLD8o=
X-Received: by 2002:a05:6808:1792:b0:3c4:2f37:f158 with SMTP id
 bg18-20020a056808179200b003c42f37f158mr694924oib.30.1711724940397; Fri, 29
 Mar 2024 08:09:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240325-public-ucsi-h-v2-0-a6d716968bb1@chromium.org>
 <20240325-public-ucsi-h-v2-3-a6d716968bb1@chromium.org> <1b040be3-acd7-40dc-bc9b-24ea6d4b8377@linaro.org>
In-Reply-To: <1b040be3-acd7-40dc-bc9b-24ea6d4b8377@linaro.org>
From: Pavan Holla <pholla@chromium.org>
Date: Fri, 29 Mar 2024 08:08:24 -0700
Message-ID: <CAB2FV=614YLrsj6yPxRd1uVsF4n3EabLoXwL1Mtrk9Eg+5Mo9g@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] platform/chrome: cros_ec_ucsi: Implement UCSI PDC driver
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, Benson Leung <bleung@chromium.org>, 
	Tzung-Bi Shih <tzungbi@kernel.org>, Guenter Roeck <groeck@chromium.org>, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, 
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>, chrome-platform@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Dmitry,

Thanks for the review.

On Thu, Mar 28, 2024 at 8:32=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
> While it's fine to use platform/chrome for platform drivers, please
> place drivers which have a subsystem into the subsystem dir. I think we
> don't want to hunt UCSI implementations all over the codebase. Please
> use drivers/usb/typec/ucsi/ location for your driver. This also removes
> a need for a global header.

I agree with your assessment that drivers/usb/typec/ucsi/ is a good
location for the driver currently. However, the driver is still in
early stages of development. We may have to account for PDC/ EC quirks
(we have multiple vendors), add FW update functionality outside the
UCSI spec, or add PDC logging functionality. While I'd like to write
separate drivers for those, some of this functionality will need to
acquire a lock over communication to the PDC. Even if I were to write
separate drivers for new functionality related to the PDC, maybe it's
better for all ChromeOS PDC related drivers to reside in the same
location. I am not sure what form this driver will take in the near
future, thus I would prefer to keep it in platform/chrome. Maybe
cros_ec_ucsi isn't the best name here, cros_ec_pdc probably conveys
the intention better.

Thanks,
Pavan
