Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F3B11DDC12
	for <chrome-platform@lists.linux.dev>; Fri,  4 Apr 2025 11:36:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743766588; cv=none; b=Cx+XsjkuiYCLeDJHkzAsRr0nzcDP7uUMZXgE3dP38qZ9wjig1f/dY9LdXdYYX5QIoyXAcpPxeGxHXVhAh/fSK/dL+9Xso0hXOl9PPwI0FCRoZEedGf/gd75DJM5OZ9enpFwtP3Ak3iBBetnySbrQCzKD3ZNytjKQdb/3BeNAA8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743766588; c=relaxed/simple;
	bh=b6lOS29QIvzQkz2tzfTijH1Smgi5dRbHoXXeQNpP2Wg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=R9hkKEqrt+XW0FoxxgDD+SdmZedxmRQelwwi2ODGitmsz4BKzxBpSGGxxxIA5vdhohs/FWretrDSQj1tsapNTD2VDLbiXCXuP0v6TtGg6br28v9v7VDlaswcZ0TMs8fUVBa4HF7OmMO5VBEjKFs06c0HCbRPC39S7xX694rQAlY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Welwq1p3; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Welwq1p3"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3912fdddf8fso1916312f8f.1
        for <chrome-platform@lists.linux.dev>; Fri, 04 Apr 2025 04:36:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1743766585; x=1744371385; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ClP9YjtKQmcvUTySn7LsfZX9TS6nE1I8Arm8XQx6bLg=;
        b=Welwq1p3uCpIZ33YB0IyVE33iI6ibMyydsQ9m9YE7BKpVi9u4wsP2cjRTqMnO/TpCS
         x/SEk1GxgURmIwIccapYP8hOv7g5kxfai8M0In35hNKCeKtbhgJ/DwDDQ9/nfxx2ZoFQ
         eQC0yjUVp51VtI/lDF1gWjzFVJVyhCog7Nmt4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743766585; x=1744371385;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ClP9YjtKQmcvUTySn7LsfZX9TS6nE1I8Arm8XQx6bLg=;
        b=qltRXeb+AzocpoYex9/Gj9/1TWDsS+01trLVRVHJFZOJrE0ml47Zf/9LqyWqtlAauu
         ibEpzysHdokf9/+BSZYrn5fnXI6k8IdgIfW3IJ6G2/AXbX0EtkAbFuSlbus4NqIA6w6p
         +v0Z4h5Djmm8z8tBUXtF80O/XKM///RpXMNtbagdmFzOKgwoHyDrKayVNvOLcZwIH5Xz
         wEndMzouo1zdWQu7+NoBqjvrWrwV5bLN5M8WWOcYNvjSTIpvIVYwRbWBddOryV/YxPMi
         MSCcQN4YIfN+0wATsFhSEArZabg85ny8Rc54jyNtiHVuj5c/fBs1H3ie8uhTPqNfRWer
         qSxA==
X-Forwarded-Encrypted: i=1; AJvYcCXQALKsrTCLPGnj4IKbGQwMxUrRRDhuegZjj2rWHbPwk4Kc742fQaih4MZKm/Fwi5U5AfbqdCYKATJeZsULHJQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YxIcpKp8ysW1J4RqIfbvG/hvN+lcRKIt206HRxt0mSss9cRgTYs
	dxHuMnZ9WbWrJPCKlqWVPIkcO/p49zV3mFq2iNiLryA9oZZUy+kUNVPiwLP7MRa/mubXT3GS5K5
	VZJar3sS0nSbkPA6Kcpi7iVBXpKi+F2+3iLSW
X-Gm-Gg: ASbGncshuCl4f5SywOMIIH74bdJXGOG5MJhzU1JM/kzuUZkj1sxyZQ5P/M/oirL9RpQ
	7x8pwlwG13QQ3GdQr41WWHLQt8jv/8vPuYLIBTZkxJ7FXjrG8+e8lWOyqy7FAPOKWlWyDnDC5Gv
	Ra+QfWLdKM/APrU9rYf2mSUYGcz4k8GHg5B4K+S91iBn9B35f16YOh9u0=
X-Google-Smtp-Source: AGHT+IHUXMXD+UoTXET/xwc7RD5TlNhuLi2TwgtR8WlkyTcizG8Gf4I0EUz9QgemOvsBb46ALzcKJVFNDmMCY0SHs1w=
X-Received: by 2002:a5d:5f44:0:b0:38a:4184:14ec with SMTP id
 ffacd0b85a97d-39cb35a11c6mr2813012f8f.1.1743766585324; Fri, 04 Apr 2025
 04:36:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250328132612.511471-1-srosek@chromium.org> <Z-z0O4KafHMVZquk@google.com>
In-Reply-To: <Z-z0O4KafHMVZquk@google.com>
From: =?UTF-8?Q?S=C5=82awomir_Rosek?= <srosek@chromium.org>
Date: Fri, 4 Apr 2025 13:36:14 +0200
X-Gm-Features: ATxdqUFT69KFlnjhu35Sr8LZAMoWIql8uhyAAi662aeXbNi_yD_Gf0bJDElT9g8
Message-ID: <CAOFuAQxK4mFeVXb6NEo_FFSJN1z_xEnca9DkbMiQZYxhUjmq=w@mail.gmail.com>
Subject: Re: [PATCH v1] platform/chrome: cros_ec_proto: allow to build as module
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org, 
	ukaszb@chromium.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 2, 2025 at 10:24=E2=80=AFAM Tzung-Bi Shih <tzungbi@kernel.org> =
wrote:
>
> On Fri, Mar 28, 2025 at 01:26:12PM +0000, Slawomir Rosek wrote:
> > This allows to build ChromeOS EC communication protocol helpers as
>
> s/This allows/Allow/.

I will fix that, thanks.

>
> > kernel module which is particularly useful for Android GKI (Generic
> > Kernel Image) configuration. With this change the ChromeOS Platform
> > (CONFIG_CHROME_PLATFORMS=3Dy) can be enabled directly from the vendor
> > kconfig fragment whithout additional configuration in gki_defconfig.
>
> Does it work?  CROS_EC_PROTO is "selected" by other Kconfigs.  Wouldn't i=
t
> be either =3Dy or =3Dn?

Yes, it is already used by android 6.6 and 6.12 kernels. The
CROS_EC_PROTO is used only by other tristates so =3Dm propagates
properly.
