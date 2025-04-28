Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7258827E1B1
	for <chrome-platform@lists.linux.dev>; Mon, 28 Apr 2025 16:24:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745857465; cv=none; b=Uevenj6B0suka6lO55erdPbFdQdsH+hAeyA9k5bU2JjdssLLJBwYs7XAiOcLblA5Vp41OPPcw/fQQxw6FrBKOIkHirWNFGOi3XR1ZbSS0o111UKAD6J0x7gpc/OwANIR2DIHd8MY2dpOvUAfLZeMBJhkJ84XWEx+F5X433/7z1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745857465; c=relaxed/simple;
	bh=aBET2R+cdNEs2JBLTJV2J6n/I6DLqblbM0N9jJcdptE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ta5TFD6c7rlv+hb+1T0FN43Mu/riMlePsgrHyAObS7EIyITwodAOuv2GPvqckCx+8ZMgqPtTCm3nvGRfIQkt5LHQuEvMp6Y51epx016CDoj5TUIPxfLH7xBZmiNnY6aI1QzNRwbXgL0NsuhgC+xOoZYWXwj197kD1IpyJwxfr1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=cWlQ/9mf; arc=none smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="cWlQ/9mf"
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-7053f85f059so45866837b3.2
        for <chrome-platform@lists.linux.dev>; Mon, 28 Apr 2025 09:24:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1745857462; x=1746462262; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9vEM8AjK36qQ7ZkludDbMcF49w6ZyxlSpknwM0aWu08=;
        b=cWlQ/9mfZzPIYejy3cBg8jvpRS/fbjlDiPjHBiKhqhuNU9317uPVFI6/f3Epyjq9I7
         sYTtShkknQxbyVdKycFAMlELvDDWgqaTEPoEzSdt5G4JBvgO+l59v6e2LUomZ+eGqvkp
         GGHaYBTxpDH2bYngFV0LtCe3OLOylI64AtWgQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745857462; x=1746462262;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9vEM8AjK36qQ7ZkludDbMcF49w6ZyxlSpknwM0aWu08=;
        b=uYCMKxTaSYG9qEmB06ppflROdEj/rG2Na/D81SN1X9p54dLBRsj7SXvD3eBVzsIKxE
         qMr68Ay4DryWo3O2VIvTQUtoMJnf2/i4J0ia65ot4v9LhZwh12bsCSO+oUsz6bD/0W0k
         sJxZlbn2l0U/YWqIZtvN3EPsH1nKkkOOfbHmbc9TgQbNzHp8resaWvyQjCK7ic7Vr32h
         Zl7namC3fG2hOgB+uv5ku0qwNsK3iNFQsphjWFemhsm3C1KMioToS0GBKUa7lNJKHXaT
         cYAB0dtiimgDFDFG4IBqvOgGhYj/DTisVV/lhuGcovelyE9e/3b/0al9g0FTTsDp2Xxp
         ZH5Q==
X-Forwarded-Encrypted: i=1; AJvYcCV4jjYvWjTLHqtR0icZyiCbKc9/XFGmVA4H8cCep2RvEcZIOBzdSh6P1HfC58YS9xIJoHaujeg/ksXqFFb3VMo=@lists.linux.dev
X-Gm-Message-State: AOJu0YzD1N/aRT8XyhFpr2BytcXl4rDLT1LZ8jap9xCaI3J1V9tg7ONM
	Dxk8qdTMoSti/CkCSw8C7g/Gnkrr7WWV+Am5Mn69T3yh3A57SlWMysSLlt5TR47ik1lL0SBwCrK
	exi48aNEnFqzfs3dfOn3RFMrVf4T/OxxaRUzE
X-Gm-Gg: ASbGnctsxm9ugr9L8N7YlrIdr5AjoFy3ufdf5eKqZQjA7XVKM00DL0BDaFhA8sJG8OL
	VmInVrPII7SNGHuQXIm9+7bQaliwTIUbWua5TwcCrmJ+UcpIAbI1EUyHFgl1C+iX42IMNOtIKQn
	NPmGklJco79BVT/4/jh1h3bA==
X-Google-Smtp-Source: AGHT+IEhniT1NFmVEmjCJcZ/tyyHLtc8q6IQL+mdJBR1gMRGoa/2Ox7aQE8eMb4K8ZNe3XWShmP+9vlTRiq6Qvv+Pv4=
X-Received: by 2002:a05:690c:7082:b0:705:5fde:1b82 with SMTP id
 00721157ae682-7089966442cmr6121787b3.13.1745857462449; Mon, 28 Apr 2025
 09:24:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250426024810.3876884-1-bleung@chromium.org>
In-Reply-To: <20250426024810.3876884-1-bleung@chromium.org>
From: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
Date: Mon, 28 Apr 2025 09:24:08 -0700
X-Gm-Features: ATxdqUHQarXuxCaiWX4uFxpbdmPmqgWPPrC_naZwTg8naWtVoPfxvgrCj4bzKVU
Message-ID: <CANFp7mWQPy2z1dWtHSw1uzMnUCcRJfaqJvGayyjmEvVjnM3KXQ@mail.gmail.com>
Subject: Re: [PATCH] platform/chrome: cros_ec_typec: Set Pin Assignment E in
 DP PORT VDO
To: Benson Leung <bleung@chromium.org>
Cc: jthies@google.com, akuchynski@chromium.org, tzungbi@kernel.org, 
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org, 
	sukoo@google.com, bleung@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 25, 2025 at 7:48=E2=80=AFPM Benson Leung <bleung@chromium.org> =
wrote:
>
> Pin C and D are used on C-to-C cable applications including docks,
> and for USB-C adapters that convert from DP over USB-C to other
> video standards.
>
> Pin Assignment E is intended to be used with adapter from USB-C to DP
> plugs or receptacles.
>
> All Chromebook USB-C DFPs support DisplayPort Alternate Mode as the DP
> Source with support for all 3 pin assignments. Pin Assignment E is requir=
ed
> in order to support if the user attaches a Pin E C-to-DP cable.
>
> Without this, the displayport.c alt mode driver will error out of
> dp_altmode_probe with an -ENODEV, as it cannot find a compatible matching
> pin assignment between the DFP_D and UFP_D.
>
> Signed-off-by: Benson Leung <bleung@chromium.org>
> ---
>  drivers/platform/chrome/cros_ec_typec.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/platform/chrome/cros_ec_typec.c b/drivers/platform/c=
hrome/cros_ec_typec.c
> index d2228720991f..7678e3d05fd3 100644
> --- a/drivers/platform/chrome/cros_ec_typec.c
> +++ b/drivers/platform/chrome/cros_ec_typec.c
> @@ -22,8 +22,10 @@
>
>  #define DRV_NAME "cros-ec-typec"
>
> -#define DP_PORT_VDO    (DP_CONF_SET_PIN_ASSIGN(BIT(DP_PIN_ASSIGN_C) | BI=
T(DP_PIN_ASSIGN_D)) | \
> -                               DP_CAP_DFP_D | DP_CAP_RECEPTACLE)
> +#define DP_PORT_VDO    (DP_CAP_DFP_D | DP_CAP_RECEPTACLE | \
> +                        DP_CONF_SET_PIN_ASSIGN(BIT(DP_PIN_ASSIGN_C) | \
> +                                               BIT(DP_PIN_ASSIGN_D) | \
> +                                               BIT(DP_PIN_ASSIGN_E)))
>
>  static void cros_typec_role_switch_quirk(struct fwnode_handle *fwnode)
>  {
> --
> 2.49.0.850.g28803427d3-goog
>

Please add a Fixes: dbb3fc0ffa95788e00e50ffc6501eb0085d48231

Reviewed-by: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
