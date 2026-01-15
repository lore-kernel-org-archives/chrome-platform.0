Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00E2227F72C
	for <chrome-platform@lists.linux.dev>; Thu, 15 Jan 2026 20:57:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768510623; cv=pass; b=JqBtP5D3hUZXXlrbmJdtcGL2kccxBFDgJtBwexbWV2Mb7K/YdlBwqmu0dNIaD8pdXuTZ2epjIGsynzL93cORfA44rimcemMclxDbdBanTh0KfVgkV2JirF4oBBH/51vRbfSifrvZJs/0UnggyBa03HvXPHxd1Snyara7emfrwMg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768510623; c=relaxed/simple;
	bh=6I58fF6TuVXRegMzDGdPH+1UeFbeJDUNF8oPGeWWasc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bQVEHNJ/A2LnBuApjLtCDjwkGKrtQ5+FJNi3oPXWh14r5a0HoksdSnrde32xbDLUUF9OXr6Pg801lXEAf6mrBhTYXNrk0lDl4py64mBboHJFq9T6iu/EJiBzNewQZV8m6h06mNl+7M0mzpyLDK9ICXY4avMkwTCn5X77fHPJbgM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=google.com; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=jYNt8+cZ; arc=pass smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="jYNt8+cZ"
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-5014acad6f2so22051cf.1
        for <chrome-platform@lists.linux.dev>; Thu, 15 Jan 2026 12:57:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768510621; cv=none;
        d=google.com; s=arc-20240605;
        b=DBsQg+jtUbzW7VwrTQxHipPsx9QZze0dj9YM52p2kUjwR+iCp+CxW1jgclGlp1TZ2w
         oxaP9fyF2cRyI+CtMF7W6K0aUtltqhW4v3Kk/sq3U4Jnfnuc8xdmhibmP9NBtUsjpF1l
         KsA/zs8E0oV+G4V+IR0LbqFzaZEoYS2tZvGwqlHImvSQYqkJOZm3C/BS1K7DoFqXWmei
         9SFqZBCr5KEzjL+wphMIGzmXv0feiLbhAvaQ4QCLWC4RhgMG4rpXVJsWnjaOJGKz85ia
         q5Oj7pY44QUDLKV9nRD8pzDQvHeMU5RO4s2312UgvvMzHIyBfmJpp4gtgMoj9bSeEGd6
         eO8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=6I58fF6TuVXRegMzDGdPH+1UeFbeJDUNF8oPGeWWasc=;
        fh=B1mFzZdGKP4ZhjV6cA8tKuZqe1P5q4sS9JX2B02MHOM=;
        b=eovzIr8NN3e/tTa/LxZQ+WTTojSl8f4Z0DY0D8EepphxL+15C4gXKu5TyWMGhDrHj+
         wdonDspWG716f++S0B4ybMaSs2u6//FPAyXxFTykSOThS9n9k2PwHTo/U9o8rbKz0RDp
         bUNdMsBW2Dp6+897px4o14rw3KR2OCxN4c5mxumXIZ6jQ6eMrOimJLcR+UEnBVhETOtB
         L8w3xKy4zasaupwAnPijqzmPFzIP00ghpQowACf7BlTg9/eNi+Cily2Ruwy3DbYey9SO
         oFCyAjkN3W1ZTC68ckeCBBBTlzTStooWM5IkckR2EKxdvQ6A8AUmd93Mk+J1VIazpfTt
         uE5g==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1768510621; x=1769115421; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=6I58fF6TuVXRegMzDGdPH+1UeFbeJDUNF8oPGeWWasc=;
        b=jYNt8+cZaH5bblwicX5fjoJsf+EupAO3Q4fERK8yksU22dzWrQD1HZ7PDcOlSRfDX9
         ZWStpeoJhOSHQinHE5v2lCg4hhO9t9zozo6OV1Tz394iPH4ndiz7EPN/xsZ5yCgmqorO
         vs5y6LXshSKMVgWVC8dD+/cuhNaIX070taZqI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768510621; x=1769115421;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6I58fF6TuVXRegMzDGdPH+1UeFbeJDUNF8oPGeWWasc=;
        b=aJWAAw4L+p5pgWI09UpCvPJLdZ5nZ9/CWqFxGptwtbQwFrynIFm78tZ64VLeF3fEVA
         s7/3VqYhF2czmUm+/G+LR9zDn6UJ/zjx3GyPZwzV0Fr4t5UUX8Tk9KdKl6Dgzd3pum5g
         YThzrVAYI4MQjDQ6Z2L8riraFxBdQx5P6oVI+Mlxz+iKM7RUy588aKOymaLF2LCgKQNo
         EFZXHwJETn1YZLfeGM7a1WzGA1IZZATC3OOXq+3lU2yAe2ejr6ZmxWvk06udVzhbBdSC
         la4CRdVFJ2Q5ftVRE4CdXCOi6p8qkzIDN6dZzrW3mKABOyncJb1c90Iu7W3sYUMEv8Mg
         xjew==
X-Forwarded-Encrypted: i=1; AJvYcCUBqdzq7iCyabT7J/zu0C56/F2c8aNkQfplrBNzZ19+71QTzY1JrIZAUYbQ0qLn+V+6PUZJ30a+tGwZRB0wO6Q=@lists.linux.dev
X-Gm-Message-State: AOJu0YwZEBX3EqnP6eklvWipxN3mBfqFFoN5h1xYromhrX72YdhgkW6V
	YRKgnXFWP442fXrQPJcrWG92j0kq+K4oR4PGczJzrmtpVkN04uydhFxx6ONxHuKIqOLavaQ1VP+
	E31lKAfH5IggTvYkxXzVXx2w0hBV2XyYLdAqwBM3W
X-Gm-Gg: AY/fxX7RB59pgfCutbyqJP01gdqUPU4XKVLWEmpJ9IU5WP+qjwRMXEnZmucb4hVDhj6
	l5RuBDG0PBC9MR+ucObmuYQg5YNvSMGRdeQgtJr4DspWr/HfZvs+3akHSxLWTXSbi/f6Bewy3Cb
	VAThaCEMhgxCqW6e3Gzl8WuUzcY46gMeJhPfcsE5S1M9I/m4n2PYoLw6sPuqsvcvI7pUzwil+j9
	D7PB9J+UnP4kzXHRhuq64aQ2SCdUGgnxQ375K4XgEG5DrVRMCF0xHptusbWUuHpe+G3/EolhLj/
	UD+odHTZUHAvn1akOYLotPqNuQ==
X-Received: by 2002:ac8:5d08:0:b0:4ff:bf96:db86 with SMTP id
 d75a77b69052e-502a23dc15emr2080621cf.16.1768510620599; Thu, 15 Jan 2026
 12:57:00 -0800 (PST)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260115082128.12460-1-tzimmermann@suse.de> <20260115082128.12460-10-tzimmermann@suse.de>
In-Reply-To: <20260115082128.12460-10-tzimmermann@suse.de>
From: Julius Werner <jwerner@chromium.org>
Date: Thu, 15 Jan 2026 12:56:48 -0800
X-Gm-Features: AZwV_Qg5K_5_9lpK3wrMnXsEAg9k1xj0wh4ZSps8vZ_Tg0OFv5Ka7-vAGXG0iEA
Message-ID: <CAODwPW_uDHQHpcMYd-tu0Ld5e+7MQ5OVUtUgM8hnrg8crY22vA@mail.gmail.com>
Subject: Re: [PATCH v2 09/12] firmware: google: Pack structures for coreboot
 table entries
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: tzungbi@kernel.org, briannorris@chromium.org, jwerner@chromium.org, 
	javierm@redhat.com, samuel@sholland.org, maarten.lankhorst@linux.intel.com, 
	mripard@kernel.org, airlied@gmail.com, simona@ffwll.ch, 
	chrome-platform@lists.linux.dev, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"

Is this necessary? The coreboot table entries are 4 byte aligned, so
only the uint64_t fields are a problem. In coreboot we solve this by
not packing the structure and instead using something like this:

typedef __aligned(4) uint64_t cb_uint64_t;

I think the same solution could work in the kernel? Packing the
structure makes all alignment assumptions go away which can cause some
architectures to generate really bad code, so I've learned to try to
avoid it where possible.
