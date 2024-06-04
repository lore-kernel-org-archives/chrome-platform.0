Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CAF514AD23
	for <chrome-platform@lists.linux.dev>; Tue,  4 Jun 2024 19:09:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717528152; cv=none; b=R/rKV/w17h1zjDeP+5RAvuv6jWdE/aVl+ZWcbr5aiYjUk/7C+U2Qx41bNuQC2VaSMxwHEWr6XSRqj8/BOb3HrfMB4ZzNoT3QcrpHxLYIhQAsRdPniE9BX5+NiBas6YPgjyEnba9KylDEN5nwNtnwXujK0ksR5/wifVlC+pYkbWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717528152; c=relaxed/simple;
	bh=5O2hvcEPB+WifLBOM64rjrb5IN0YGFwc6fcMkZJFpNw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tWgZVO123EIsR4z9tgKbwCWotDFdtn9rZ1iI5SEzBh9VuN2+y+FPB/DgV592CcEBFDjgWEuamvZ9vLCCKt7jNVoyQxxliQz4Cc2NHnmW45IxevmNgas9s/gkoUh0Jew5qvjcjONu6x/ofO2+7aqNkPX0ikN3Pza4igo6fBvERtM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XXsEH7/B; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XXsEH7/B"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-1f692d6e990so14056195ad.3
        for <chrome-platform@lists.linux.dev>; Tue, 04 Jun 2024 12:09:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717528151; x=1718132951; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lBlKoYwvZRYVCTZgzTwhw1nqnwRx3L1d/Hdiocgdp9c=;
        b=XXsEH7/BBFdHxqcUQIMtlxIcUPsPzmGhbjr4HO50/Ahvm1ybLOFkaCQeW94xidJsT7
         sUd3tp9spWpSelaDI11YjBuC9m+1TBwUQ9sxFrfZ5Urd2yC9KI2deG8bBREyLN0mcXy3
         W6zfNc7qfVtab2d8jSGoc2h82Oivni47JNn+fCdcAWCt2wkLycNMaDuSwPlF08W9X/Wm
         DjOlyMSxbhqu7u/ewPx8oYG5FN0b2LNRKluFMT2L+NMADPEHWLWG4h6cvG9qZUjlKJQP
         4fWnF2SgwfGU0gPTb0XcKJibhwFtibuGtIWPt0HMWwYWB8D1z0S4Jhb3n0bZesiRPYyS
         5T9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717528151; x=1718132951;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lBlKoYwvZRYVCTZgzTwhw1nqnwRx3L1d/Hdiocgdp9c=;
        b=vE/SWR8B0OTXSoAvIQ6LZWVR22fVFrPpc2tsfBJjmq+7ZBJ70aMEch4ht9uBxmSMTi
         Hc2IjtDz3o4LB0LJ2UP3BvCrF6zuCq/ehbdqfTPgtSBY3BLur9VL4IpvrvdELckwS8eO
         A4+wqo5MuMx8ZO/Towl+TgK8VUgAZn0szA5nGT9q+tcgufTPsdj6obmlOw06Yy7Ly6kX
         ArwK0XoH60/h+Fc2+XV0hZYHwFqKtoHKtQ3QFK217sPztgqwDxddS0kH/alXkxjQWBd6
         7a77w2PSLsgJNvZDMVAZtYDLmlDv0GQegV/bxMY2kr9qzemhk7QDeU1g9emqTT1pyNPd
         Oq/w==
X-Forwarded-Encrypted: i=1; AJvYcCXHswxZ/z2tEw+Z5jc8tVaHIFS0o4O0dNCuLEmPtbMMRzdNFzgDubFq/FiO6OoO6K4ehdVqwZx3cB0a/4GRY0ARk6WBlZU6ZfbC1ncNTfrW
X-Gm-Message-State: AOJu0Ywj5PnTh6DCrgY/XW9FA6fO8KJbjF1B6JaXjULXrv2RNEwgMH7o
	vofp4znJvfEEaYDBgmnkFtx2AlScvxve4+O5C/ccwDS3EF8h/sFx
X-Google-Smtp-Source: AGHT+IF2CgvPQeC3wsa6Wxy+YuRpwdo5sw8trQD/dcdJCI61OHiJLZHSBEaHAviXAx9+GkCKCcbzOQ==
X-Received: by 2002:a17:902:f547:b0:1f6:700e:a2ca with SMTP id d9443c01a7336-1f6a5a28eb1mr5424485ad.39.1717528150639;
        Tue, 04 Jun 2024 12:09:10 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:1327:f82:3fa9:728f])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f63232dd6bsm87130275ad.54.2024.06.04.12.09.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jun 2024 12:09:10 -0700 (PDT)
Date: Tue, 4 Jun 2024 12:09:07 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Daisuke Nojiri <dnojiri@chromium.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>, devicetree@vger.kernel.org,
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-input@vger.kernel.org
Subject: Re: [PATCH 3/3] ARM: dts: cros-ec-keyboard: Add keyboard matrix v3.0
Message-ID: <Zl9mUxT2XXKHdb_e@google.com>
References: <20240604005354.2294468-1-dnojiri@chromium.org>
 <20240604170935.2518856-1-dnojiri@chromium.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240604170935.2518856-1-dnojiri@chromium.org>

Hi Daisuke,

On Tue, Jun 04, 2024 at 10:09:33AM -0700, Daisuke Nojiri wrote:
> Add support for keyboard matrix version 3.0. To enable it, define
> CONFIG_CROS_KBD_V30.

I might be wrong but it looks to me if one enables support for v3 keymap
then the kernel will not work for devices using other/older versions of
keymap. It might be acceptable for Chrome OS kernels but will nto work
for upstream.

I think you need to create arch/arm/boot/dts/cros-ec-keyboard-v3.dtsi
that would define "keyboard_controller" node with proper keymap and
include this new dtsi into std files for devices/boards that need it.

Thanks.

-- 
Dmitry
