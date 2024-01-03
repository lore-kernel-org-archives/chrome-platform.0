Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4FAD219FF
	for <chrome-platform@lists.linux.dev>; Wed,  3 Jan 2024 22:45:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="HwyL1G8X"
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-5e778e484dbso96411607b3.0
        for <chrome-platform@lists.linux.dev>; Wed, 03 Jan 2024 14:45:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1704321917; x=1704926717; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DEw32uZAICaUrTJvazqtRNht7MeZaCeNqiU2wjyj0fY=;
        b=HwyL1G8X//haHubXlpdc/4ml1HMDwlvJ3ro+QymNYkMM4fIQu3prMtKworBqn4Z7mD
         DUN+NM+G2qbIRB3bRTexKbxiaBhZ0koLAIISPQ1AkmMmmDXPMz/4FCTjNftiOmk2A+gx
         jbQgbswOvXAyiZOIGScL7OXwMfNc9rH7r/smo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704321917; x=1704926717;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DEw32uZAICaUrTJvazqtRNht7MeZaCeNqiU2wjyj0fY=;
        b=aehoOiFcDZaeLwNqwbTFsIoYDU3Dcr7qZWF/LQAmQDR08xI9q4TRd9KcvBYdhLK5jk
         xzU+LAbvIphP5R6a5vLe/FNkMPk7PZJYSSeY9pPNmUIkgUIUNUAj5Cuxcas2OfnDSDhl
         EIIeXRjHg/Jg7PXotA4bdJQ4KX4F17kzBOSxPbqlI2ZrqiSoQsP4qfEZ1m62yny9HV33
         Y7nrukPasZCy0klLkkMYlGJGlJGrXkppic79X8HIpRWF+rtXxTKl8Mjzm2mWZHzVUCy1
         5yfp0DsQQ7RBUzOE2FMd3QXN+17z6XyYClLbThJZL07LoANq4I6/RELcBjkNb3BjPmTY
         47sw==
X-Gm-Message-State: AOJu0YwpTe/H9talZ4AYXXxwJjSkG5B2GxwQp4H0bv+G9R2vyXflVUR6
	fUM5EZi/YYDGIvmWrzQhRJvq8rX71yTPKe0xiwWvIRseFe06
X-Google-Smtp-Source: AGHT+IGf0ISPE4ggBpxDlD+a/3NTjJoY4OX3TD43ypJqeZcRDCerJpdy7UVWqgV7e0uQNp9+A7LwDs/bNXeb3klLnpw=
X-Received: by 2002:a81:5483:0:b0:5d7:1940:dd83 with SMTP id
 i125-20020a815483000000b005d71940dd83mr14754276ywb.89.1704321916927; Wed, 03
 Jan 2024 14:45:16 -0800 (PST)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240102210820.2604667-1-markhas@chromium.org>
 <20240102140734.v4.24.Ieee574a0e94fbaae01fd6883ffe2ceeb98d7df28@changeid>
 <CAE-0n50zkwZ8nguUJcL1gjbuavhSU_rLxfGhanxB4YA7N34hLQ@mail.gmail.com>
 <CANg-bXByhaSngW2AAG9h6DYHpiTUvh8+yw3LPU6ZQSCb62M-wg@mail.gmail.com>
 <CAE-0n52u68wMHJGe8=jz4Y1y2=voycFEY15keebz9tPDDBgiqA@mail.gmail.com> <CANg-bXDzLJgWLuH8Xj4GLYG=AVfcbmi_EfrA7DaHj4F6i350DA@mail.gmail.com>
In-Reply-To: <CANg-bXDzLJgWLuH8Xj4GLYG=AVfcbmi_EfrA7DaHj4F6i350DA@mail.gmail.com>
From: Mark Hasemeyer <markhas@chromium.org>
Date: Wed, 3 Jan 2024 15:45:06 -0700
Message-ID: <CANg-bXCU0Y+GOf9w2j5suoq+F=AnE-NPuhOYjGtpoG3W4WT6-Q@mail.gmail.com>
Subject: Re: [PATCH v4 24/24] platform/chrome: cros_ec: Use PM subsystem to
 manage wakeirq
To: Stephen Boyd <swboyd@chromium.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Sudeep Holla <sudeep.holla@arm.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Rob Herring <robh@kernel.org>, 
	Andy Shevchenko <andriy.shevchenko@intel.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Raul Rangel <rrangel@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, 
	Benson Leung <bleung@chromium.org>, Bhanu Prakash Maiya <bhanumaiya@chromium.org>, 
	Chen-Yu Tsai <wenst@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
	Prashant Malani <pmalani@chromium.org>, Rob Barnes <robbarnes@google.com>, 
	chrome-platform@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 3, 2024 at 3:25=E2=80=AFPM Mark Hasemeyer <markhas@chromium.org=
> wrote:
>
> > The DTS patch would go through the platform maintainer tree and be
> > pulled into the soc tree and sent up to mainline from there. The
> > platform/chrome patch would go through chrome platform tree and then to
> > mainline. The bisection hole will be real.
>
> I thought it would all get merged in the next merge window. How are
> bifurcations like this normally dealt with? Does one wait for the
> first series of patches to land in mainline before submitting
> dependent patches? That could take two merge windows.

The DTS dependency problem must be an exception? How are other
dependency problems resolved? For example, this patch relies on
changes to 'platform_get_irq()' which is in drivers/base/platform.c,
which I imagine is in a different subsystem and gets merged into a
different maintainer's tree.
