Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56E221F3D56
	for <chrome-platform@lists.linux.dev>; Thu, 13 Mar 2025 23:23:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741908226; cv=none; b=uZW0zeMsDVnn22Oy7GLzwjM2mLMVVjfp/BSvGc9Kg75prG+b3aewuf7djqx8n2/3ySAE76Lt308PKLcSMA16i2o4U2OUW5hKyS9+qPVpI/wGFaXbTEKqdalfDcUOzjyQOcUrKO4aT8NDq/IyNdN3xm9pG89hJykY655eSukXE2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741908226; c=relaxed/simple;
	bh=03hqJnuK1CVGKDG0J1rE6YrOQUCHMsfOL+m7YMiPdhw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GcYYEHaDSHgT3h+N63gAYB0ucinTTllthIh8bBHu/PHHvaDgJCeEwL460GTXR9xKea3wNxhAp6aJMan/uC+Cjv2FWz6lSyIoVUqhwm9pcW0gzof7SHvxs8V7EF6In6hmpOSV1saIxkZGxRsb4uwWWkXrbnaC8Q7Sa0F/2ydOup0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=nvCZhrMU; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="nvCZhrMU"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-ac27cb35309so239575666b.2
        for <chrome-platform@lists.linux.dev>; Thu, 13 Mar 2025 16:23:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1741908223; x=1742513023; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UCMudYCsiUfPpJxSCb7AZiMA+eXp5wJ3W7GXcaA01zk=;
        b=nvCZhrMUGxxa39MtM5dJMdVgMYOjEoQvuFSLFPcOTruXcNQ0BSXNeG0SQXbOQWQJuQ
         78OJTcWR+fwrmp2p21ac+6HN+Fc8DZXGje4YedzBnBjtZSrsZ24JZ1N9wwaBQuW6HzkN
         hWzKeedNYHZRPDJNed/0+JNWa/vNvUJrKmcTmRmF6saIs8MfE7dgiqI/uqqcvxwOWj3z
         sA9eoc++rJeQM0fk8WRo+Drf9Hk16rAKCZx5hAtg0/hICMjC+se/KMyAJ9WTS/N5r/1c
         9IgzATJGzeIxvFq7lX6OpnBLKN6NXvahPSL4c4KeTBA9W822gCpGDnUUK7Smz33X4L//
         /WeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741908223; x=1742513023;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UCMudYCsiUfPpJxSCb7AZiMA+eXp5wJ3W7GXcaA01zk=;
        b=ZJJz0pI/er/0ibqaPA0Jvh6IXOK+UJwY1x0kLv1iZUBKw4KO2Vk9jVxVDJiNORMsBs
         E9voOQfAixj1O3M8rAnn433L3WFPN4o4zuBaA3gQu/J84og5oh5Ihp13RGp//JO2UQiL
         hpwlqyxrtjUF6/wWhcr6q1Z8tLjsSrhEW9VXTmY2XNAYmcSfZQIHz8sfhAgcbvvXG/XL
         umjKHwt7XaLcjcueyzYDevuqEifwn+RFAvY4q9UgUhXlSDOAFtxhkKmR6mYU+scENWIc
         cwZQ5E29TRSlFystW0VRgvvvOyniwFwWW3o44Unr55NHI56LcuwoDEgrgKMi/cQ4xnBF
         qkQw==
X-Forwarded-Encrypted: i=1; AJvYcCXTnQ3bao+w0vAObrbm7SXyegb/F1fPzQH+D5dQ+fYzsxbNwVsK2MQAyeHbQfSUcWAjshOOA7Vs0i1ZaJw2oTQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YxMZWMP4tZc65cSZl2MpSxr2ES8gH/K+620L+QIFklBKzzVJ8W0
	EAB4td1HJtx4G9rxLKrZz+oiJEvbyCDdbi5MgrPwyAPI917fTvxC8v+a4n3uvWhIJ+PiNIzfPED
	bo5LYMohE4JDXZF5OIO9ObDODdrSf4h1/yGGF
X-Gm-Gg: ASbGncvlEMajRueSIIRxHJ0I66sygbi4yHM0bIAZ99jYBhwrgEGRjpyHwjqOknCaikh
	xQMOVfDXDnoaXNed58AAt9bjWBvjCrC0wfcKwu9ItOBV21SmzBFU1B/nYAY5pf/cVzdzJU7iIv+
	scbdS1cAUjA/RCVbJYrvR1M7vsaFpGRIyr4P1LZ1Ab83VcFq9/vXoMUBc=
X-Google-Smtp-Source: AGHT+IHjRZmiFK4Q9ZkNGdZSuSwWBLKWpzjANTknswcUF/yqPrUOK+YMTqHc4G39LZMn33UVLCx9GiofUg2Ysz20FDE=
X-Received: by 2002:a17:907:9694:b0:ac2:d2f3:6c30 with SMTP id
 a640c23a62f3a-ac3303db128mr36303566b.49.1741908222584; Thu, 13 Mar 2025
 16:23:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250312195951.1579682-1-jthies@google.com> <20250312195951.1579682-2-jthies@google.com>
 <13c6d57b-0235-4c8d-95ef-111f87d6c25d@linaro.org>
In-Reply-To: <13c6d57b-0235-4c8d-95ef-111f87d6c25d@linaro.org>
From: Jameson Thies <jthies@google.com>
Date: Thu, 13 Mar 2025 16:23:30 -0700
X-Gm-Features: AQ5f1Jp4TvsDR3UGIWQbuMD6uRPeohSBsXrCOM-uSTZZYdf4-rx0RWVAFEBnFIQ
Message-ID: <CAMFSAReJpppA5eb2mxf8ZCwrR1HcBeGWaNXBoFmKq5swKboMJw@mail.gmail.com>
Subject: Re: [PATCH v1 1/3] dt-bindings: Add cros-ec-ucsi to cros-ec-typec
 device tree documentation
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: tzungbi@kernel.org, ukaszb@chromium.org, bleung@chromium.org, 
	heikki.krogerus@linux.intel.com, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, groeck@chromium.org, swboyd@chromium.org, 
	akuchynski@chromium.org, devicetree@vger.kernel.org, 
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Krzysztof, thank you for taking a look at this series. Clearly it
needs some more work. I=E2=80=99ll follow up with a v2 addressing your
comments.

> > -  cros-ec node like google,cros-ec-spi.
> > +  cros-ec node like google,cros-ec-spi. On TCPC systems, ChromeOS shou=
ld
> > +  use cros-ec-typec. On PDC systems, ChromeOS should use cros-ec-ucsi.
>
> What does it mean? How is it related to description?

TCPCs and PDCs are different components which can be used for power
delivery messaging on USB-C ports. On ChromeOS devices, they are
mutually exclusive. This line is just saying which driver should be
chosen based on the USB-C port hardware. But, I see that type of
information isn=E2=80=99t really relevant for the device tree documentation=
.

Thanks,
Jameson
