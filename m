Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D346D4A12
	for <chrome-platform@lists.linux.dev>; Sat, 23 Dec 2023 03:11:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ZPySctb1"
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-67f8d9fe99fso11396306d6.2
        for <chrome-platform@lists.linux.dev>; Fri, 22 Dec 2023 19:11:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1703301083; x=1703905883; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zdB95tcPTNTK+3756tuniTgYUz4rjOim6SidLwlZH4M=;
        b=ZPySctb1994ku2Xq0SgmwLZ8gnZarzKX3fcL161wQA111eD+8zl78ZOYgbN/sF5Bd6
         pHN61G9+7f6TnBkvNxWgDkur9gOpMBkQu8BzCWMx4pIjg8GnAO8UtQOAhEA8+R+vIuF5
         mNNoEOgycCJs3kIPqT4bfPBnPovAKaC5FcoSs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703301083; x=1703905883;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zdB95tcPTNTK+3756tuniTgYUz4rjOim6SidLwlZH4M=;
        b=i8dezjOctBobP8ehSIFsPV+oTEBVxXEpav/YKh/RZfJMinCnttTuiNNhCu6BWVYLJL
         PA0BrtZb5hNLE/ZplDObnacoMYzrA1cjeGNy44esgZ9sHiNTu6PnDGhLOVRN0vkwMS3p
         ucdX7M0Z3JSxdFrMHsVew1ExFvmgeiPZoKgBUBouaBpzcNP1/oopR4kECeoxxjrA1Y+T
         GlQq/xA+QDffm6jBlly7YWSvnwXKah8gTqgIRhjD7glD8PIPHLeT8YAC87J9uYD/Bv2a
         mgNF7R6vKO8OFh9FnP7ht7SIF5cZ9pLJQ4f0lF/5SQFAhOGhWNkKNSDYtn0cQJVJPIzU
         6VlA==
X-Gm-Message-State: AOJu0YwCVik8AMeTl3KfA1Ux3s4MrsnLxLBRes9jOpGLIvSY77/I89GB
	UtgVi4pYKC2W8IA/NhLizcCR9kMMc+StXhRrUvmsDwvaujs2
X-Google-Smtp-Source: AGHT+IEFXIQyeySBlTmbcC7JEzlV/6XXt89+GaVfOEdtXDERfikf8LLPBcse2GmVVO3swktMcuaw1HSP6jN5pWYvF74=
X-Received: by 2002:a05:6214:e63:b0:67f:27a3:4d0e with SMTP id
 jz3-20020a0562140e6300b0067f27a34d0emr3733532qvb.54.1703301082855; Fri, 22
 Dec 2023 19:11:22 -0800 (PST)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231220165423.v2.22.Ieee574a0e94fbaae01fd6883ffe2ceeb98d7df28@changeid>
 <202312230846.9DkpFRNv-lkp@intel.com>
In-Reply-To: <202312230846.9DkpFRNv-lkp@intel.com>
From: Mark Hasemeyer <markhas@chromium.org>
Date: Fri, 22 Dec 2023 20:11:12 -0700
Message-ID: <CANg-bXCsB1cfRqsY4yx9X9_5GG1O+9jT0uDX6hJfj7fCRiVg+Q@mail.gmail.com>
Subject: Re: [PATCH v2 22/22] platform/chrome: cros_ec: Use PM subsystem to
 manage wakeirq
To: kernel test robot <lkp@intel.com>
Cc: LKML <linux-kernel@vger.kernel.org>, oe-kbuild-all@lists.linux.dev, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Tzung-Bi Shih <tzungbi@kernel.org>, Raul Rangel <rrangel@chromium.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Andy Shevchenko <andriy.shevchenko@intel.com>, 
	Rob Herring <robh@kernel.org>, Sudeep Holla <sudeep.holla@arm.com>, 
	Benson Leung <bleung@chromium.org>, Bhanu Prakash Maiya <bhanumaiya@chromium.org>, 
	Chen-Yu Tsai <wenst@chromium.org>, Guenter Roeck <groeck@chromium.org>, Lee Jones <lee@kernel.org>, 
	Prashant Malani <pmalani@chromium.org>, Rob Barnes <robbarnes@google.com>, 
	Stephen Boyd <swboyd@chromium.org>, chrome-platform@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 22, 2023 at 5:37=E2=80=AFPM kernel test robot <lkp@intel.com> w=
rote:
>
> Hi Mark,
>
> kernel test robot noticed the following build errors:
>
> [auto build test ERROR on robh/for-next]
> [also build test ERROR on chrome-platform/for-next chrome-platform/for-fi=
rmware-next wsa/i2c/for-next driver-core/driver-core-testing driver-core/dr=
iver-core-next driver-core/driver-core-linus linus/master v6.7-rc6 next-202=
31222]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Mark-Hasemeyer/gpi=
olib-acpi-Modify-acpi_dev_irq_wake_get_by-to-use-resource/20231222-172104
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git fo=
r-next
> patch link:    https://lore.kernel.org/r/20231220165423.v2.22.Ieee574a0e9=
4fbaae01fd6883ffe2ceeb98d7df28%40changeid
> patch subject: [PATCH v2 22/22] platform/chrome: cros_ec: Use PM subsyste=
m to manage wakeirq
> config: riscv-allmodconfig (https://download.01.org/0day-ci/archive/20231=
223/202312230846.9DkpFRNv-lkp@intel.com/config)
> compiler: riscv64-linux-gcc (GCC) 13.2.0
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20231223/202312230846.9DkpFRNv-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202312230846.9DkpFRNv-lkp=
@intel.com/
>
> All errors (new ones prefixed by >>):
>
>    In file included from include/linux/device/driver.h:21,
>                     from include/linux/device.h:32,
>                     from include/linux/acpi.h:14,
>                     from drivers/platform/chrome/cros_ec_lpc.c:14:
> >> include/linux/module.h:244:1: error: expected ',' or ';' before 'exter=
n'
>      244 | extern typeof(name) __mod_##type##__##name##_device_table     =
          \
>          | ^~~~~~
>    drivers/platform/chrome/cros_ec_lpc.c:67:1: note: in expansion of macr=
o 'MODULE_DEVICE_TABLE'
>       67 | MODULE_DEVICE_TABLE(dmi, untrusted_fw_irq_wake_capable);
>          | ^~~~~~~~~~~~~~~~~~~
>
>
> vim +244 include/linux/module.h
>
> ^1da177e4c3f41 Linus Torvalds    2005-04-16  240
> cff26a51da5d20 Rusty Russell     2014-02-03  241  #ifdef MODULE
> cff26a51da5d20 Rusty Russell     2014-02-03  242  /* Creates an alias so =
file2alias.c can find device table. */
> ^1da177e4c3f41 Linus Torvalds    2005-04-16  243  #define MODULE_DEVICE_T=
ABLE(type, name)                                       \
> 0bf8bf50eddc75 Matthias Kaehlcke 2017-07-24 @244  extern typeof(name) __m=
od_##type##__##name##_device_table             \
> cff26a51da5d20 Rusty Russell     2014-02-03  245    __attribute__ ((unuse=
d, alias(__stringify(name))))
> cff26a51da5d20 Rusty Russell     2014-02-03  246  #else  /* !MODULE */
> cff26a51da5d20 Rusty Russell     2014-02-03  247  #define MODULE_DEVICE_T=
ABLE(type, name)
> cff26a51da5d20 Rusty Russell     2014-02-03  248  #endif
> ^1da177e4c3f41 Linus Torvalds    2005-04-16  249
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki

Failed for riscv arch. Regardless, MODULE_DEVICE_TABLE macro call is
being removed in the next version.
