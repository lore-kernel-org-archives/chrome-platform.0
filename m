Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90AA81D1E96
	for <chrome-platform@lists.linux.dev>; Thu, 17 Oct 2024 21:02:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729198976; cv=none; b=uWdjqcLycs/PSe/7L0qIwTaLWQkvwvRAnoW/NY0uokscY0T9E/RHAfMmp12ZuGoTOxGbz6GVFjRrgv9yaFhYh7wkp41L25uoNhwA3bc/adhamejW+URgHNW9ji9NBdbfP3mWXZ2oEG506gpBjxkfcgptBT6t/jSvyGk2OIUmbkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729198976; c=relaxed/simple;
	bh=qwfWpxeyhpiPKYSudRqo5jr8XsgShlrd1VLDFv5fJFc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hIKE/L/y6mIUNj9rK1tTIwvxs1TEU4qtqAU4pAU/H6z2bw4Bl7jQQ6ifNLk//c16WVKAiyoAYtTCJpyS3FiQ7U/9hQAhqwXo2IbPxfRFtXdGS63AZ8SZnlUQ01El7zwYDmm8we9OJ1nYU/IxEkHXFGc2cxXXZI+KgXMw7tDzyn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=IVGcEbbn; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="IVGcEbbn"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-a99cc265e0aso185981766b.3
        for <chrome-platform@lists.linux.dev>; Thu, 17 Oct 2024 14:02:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1729198970; x=1729803770; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PplG7VVviuXhuSv+Ud3YH+rqp5m5boGul+BQVv7DV/Q=;
        b=IVGcEbbncLZmcoV9Wkvvj07SqYazqfKcqBTHcmslq6imEMPtJpZvb1EmRBhGmha1q/
         6oyfxeBowVo70UNOsBWfm9SHek/TUMHSzl/+uDAcO3EI7cqTX1ng3mSkg0bSPfo/mgdP
         +NJB+IejABpnFrtjDUUuUAACz76dS9VwKVhs8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729198970; x=1729803770;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PplG7VVviuXhuSv+Ud3YH+rqp5m5boGul+BQVv7DV/Q=;
        b=mdCCwzbYlsHVHgmQ3rOj8kDjsgRKbMrpE0QrgGNqMDuqXCMDM8jveOmLJwyjfotGzJ
         ppjQeaV1mWTx/3mCynONC54jIPhvRezCmaPrlCmpd+9ucNWe/T6Ft68E2+m6m/pGCGk/
         zJihh0jP8rFNL/dOFc5+uKAZXlVsy5hqyh/z7Z7bGtSbR/BUuT2IBZARL8i8294UrpjO
         qh2JhYwJf33GFi88+4b66C1lAaR/J+Dngdtoqi9YldnNHlryk0LM6SwfzfgzV57BEBz2
         UpmuD43sagv+Qy6mDyq3ZdV4QlBtPAzyq/YFLNGZOqyQO3zyAi9MLlgCYeh8UDG/nz7x
         JyKQ==
X-Forwarded-Encrypted: i=1; AJvYcCU3O3s88r3sQk/0xRN21tTYFLvXoIdpUPcIXQP4i3/xBvqI5NkP+TJGr6VmfLo/+Dh1whw2VvRX8i6AyLcAYPM=@lists.linux.dev
X-Gm-Message-State: AOJu0YwQ/F9aZVtun8vdkZTi2KT+NcfyU14m4H291REjo+0DjTKgSTcZ
	nM0m9T9TkGs/TDC/IkKZTMfwyAr0lpbGQK6KkUlRT9Gvbx6V4RTcMn7C0pP7WO7v32kM8xgAmi4
	tdQ==
X-Google-Smtp-Source: AGHT+IEu46H5Z+gWpIUeJw1KwdsK5v72fMJlBNiad4SPFcMy2mFBq1uUQFhCBIJafi/KkFqpG9qGgA==
X-Received: by 2002:a17:907:1c24:b0:a9a:55dd:bc23 with SMTP id a640c23a62f3a-a9a6995d035mr8745166b.8.1729198970438;
        Thu, 17 Oct 2024 14:02:50 -0700 (PDT)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com. [209.85.221.50])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9a68bc4b82sm12728766b.140.2024.10.17.14.02.49
        for <chrome-platform@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Oct 2024 14:02:49 -0700 (PDT)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-37d4821e6b4so894122f8f.3
        for <chrome-platform@lists.linux.dev>; Thu, 17 Oct 2024 14:02:49 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUfQRyQCXPT5I+vJzJlak8tpYeIsKcJx1pQa+avP2uYyC1t8QN563nTJnuDrWnAoEEx4E9zD2ydupcFgyepcu8=@lists.linux.dev
X-Received: by 2002:a5d:45cd:0:b0:37d:39c1:4d3 with SMTP id
 ffacd0b85a97d-37ea21de065mr215420f8f.6.1729198968725; Thu, 17 Oct 2024
 14:02:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241017094222.1014936-1-wenst@chromium.org> <20241017094222.1014936-4-wenst@chromium.org>
In-Reply-To: <20241017094222.1014936-4-wenst@chromium.org>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 17 Oct 2024 14:02:36 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Vy6q-nPZ99k7t8-G_osefg=0jxPUWm8F1uhtVw0xDvxg@mail.gmail.com>
Message-ID: <CAD=FV=Vy6q-nPZ99k7t8-G_osefg=0jxPUWm8F1uhtVw0xDvxg@mail.gmail.com>
Subject: Re: [PATCH v9 3/7] i2c: Introduce OF component probe function
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Wolfram Sang <wsa@kernel.org>, 
	Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, 
	chrome-platform@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>, 
	Jiri Kosina <jikos@kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	linux-i2c@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Oct 17, 2024 at 2:42=E2=80=AFAM Chen-Yu Tsai <wenst@chromium.org> w=
rote:
>
> Some devices are designed and manufactured with some components having
> multiple drop-in replacement options. These components are often
> connected to the mainboard via ribbon cables, having the same signals
> and pin assignments across all options. These may include the display
> panel and touchscreen on laptops and tablets, and the trackpad on
> laptops. Sometimes which component option is used in a particular device
> can be detected by some firmware provided identifier, other times that
> information is not available, and the kernel has to try to probe each
> device.
>
> This change attempts to make the "probe each device" case cleaner. The
> current approach is to have all options added and enabled in the device
> tree. The kernel would then bind each device and run each driver's probe
> function. This works, but has been broken before due to the introduction
> of asynchronous probing, causing multiple instances requesting "shared"
> resources, such as pinmuxes, GPIO pins, interrupt lines, at the same
> time, with only one instance succeeding. Work arounds for these include
> moving the pinmux to the parent I2C controller, using GPIO hogs or
> pinmux settings to keep the GPIO pins in some fixed configuration, and
> requesting the interrupt line very late. Such configurations can be seen
> on the MT8183 Krane Chromebook tablets, and the Qualcomm sc8280xp-based
> Lenovo Thinkpad 13S.
>
> Instead of this delicate dance between drivers and device tree quirks,
> this change introduces a simple I2C component probe function. For a
> given class of devices on the same I2C bus, it will go through all of
> them, doing a simple I2C read transfer and see which one of them responds=
.
> It will then enable the device that responds.
>
> This requires some minor modifications in the existing device tree. The
> status for all the device nodes for the component options must be set
> to "fail-needs-probe". This makes it clear that some mechanism is
> needed to enable one of them, and also prevents the prober and device
> drivers running at the same time.
>
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> ---
> Changes since v8:
> - Added missing include of <linux/kconfig.h> to i2c-of-prober.h
> - Expanded description of i2c_of_probe_ops::enable to mention that
>   returning -EPROBE_DEFER is valid (Doug)
> - Reworded descrption of i2c_of_probe_ops::cleanup_early to avoid
>   confusion with i2c_of_probe_ops::enable (Doug)
> - Reworked i2c_of_probe_get_i2c_node() to return NULL on failure,
>   matching most functions that return |struct device_node *|.
>
> Changes since v7:
> - Dropped log level of "enabling component" to debug
> - Dropped file name from header file
> - Reverted to __free() cleanup for i2c bus node
> - Corrected "failed-needs-probe" to "fail-needs-probe" in commit message
> - Fixed incorrectly positioned period ('.') in commit message
> - Expanded description of i2c_of_probe_component()
> - Expanded comment explaining check for "available" devices to note that
>   if such a device is found then the i2c probe function becomes a no-op
> - Simplified check for "available" devices for-each loop
> - Expanded description of @free_resources_early callback to explicitly
>   state that it is not called if no working components are found
> - Dropped !cfg check
> - Replaced "fail" with "fail-needs-probe" in i2c_of_probe_component()
>   kernel doc
> - Combined callbacks (.get_resources with .enable; .cleanup with
>   .free_resources_late); .free_resources_early renamed to .cleanup_early
>
> Changes since v6:
> - Correctly replaced for_each_child_of_node_scoped() with
>   for_each_child_of_node_with_prefix()
> - Added namespace for exported symbol
> - Made the probe function a framework with hooks
> - Split out a new header file
> - Added MAINTAINERS entry
> - Reworded kernel-doc
> - Dropped usage of __free from i2c_of_probe_component() since error
>   path cleanup is needed anyway
>
> Changes since v5:
> - Fixed indent in Makefile
> - Split regulator and GPIO TODO items
> - Reversed final conditional in i2c_of_probe_enable_node()
>
> Changes since v4:
> - Split code into helper functions
> - Use scoped helpers and __free() to reduce error path
>
> Changes since v3:
> - Complete kernel-doc
> - Return different error if I2C controller is disabled
> - Expand comment to explain assumptions and constraints
> - Split for-loop finding target node and operations on target node
> - Add missing i2c_put_adapter()
> - Move prober code to separate file
>
> Rob also asked why there was a limitation of "exactly one touchscreen
> will be enabled across the whole tree".
>
> The use case this prober currently targets is a component on consumer
> electronics (tablet or laptop) being swapped out due to cost or supply
> reasons. Designs with multiple components of the same type are pretty
> rare. The way the next patch is written also assumes this for efficiency
> reasons.
>
> Changes since v2:
> - New patch split out from "of: Introduce hardware prober driver"
> - Addressed Rob's comments
>   - Move i2c prober to i2c subsystem
>   - Use of_node_is_available() to check if node is enabled.
>   - Use OF changeset API to update status property
> - Addressed Andy's comments
>   - Probe function now accepts "struct device *dev" instead to reduce
>     line length and dereferences
>   - Move "ret =3D 0" to just before for_each_child_of_node(i2c_node, node=
)
> ---
>  MAINTAINERS                      |   8 ++
>  drivers/i2c/Makefile             |   1 +
>  drivers/i2c/i2c-core-of-prober.c | 182 +++++++++++++++++++++++++++++++
>  include/linux/i2c-of-prober.h    |  75 +++++++++++++
>  4 files changed, 266 insertions(+)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
