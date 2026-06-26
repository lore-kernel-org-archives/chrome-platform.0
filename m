Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C767F3E5567
	for <chrome-platform@lists.linux.dev>; Fri, 26 Jun 2026 07:46:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782459970; cv=pass; b=ToJnTT/C3OHXHJX7c4MZSsJyPr8q7X1amUqh4nGAptR6nEkQk92bnWyAYeMZltNSAJ5sdVJRViwaRQ8AHGeECmF4xKdecMjUGxAzQLuBOBRWtQ+XecvKn9/5/wzbfpDWaRJRWzHj93VP5AZ0K2rTuZTEcL19SPIj7urgJoFrR3s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782459970; c=relaxed/simple;
	bh=x6Pg1mcHQ3z3LYXiiYBJ9GRVInmoGYVVJStwz6FHwmo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Cg2exo1cHwy6z1JwZt6vBoWQCk00nwq8VQ3ngFN6yDHEQP+zPYt3VAYGUCUlnjEZLYHtazHSF7NghMG1ZSX+OSY4hsFp9vo5TdfEvJhKMEFDi8ZEpvv1BMzrTE5LLOPO6g0fNdPiQaesDADd0y0iZIyuyHJjh9wWrdJidLmJz8Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=OMfdV3OA; arc=pass smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="OMfdV3OA"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-84347ad88edso552060b3a.1
        for <chrome-platform@lists.linux.dev>; Fri, 26 Jun 2026 00:46:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782459967; cv=none;
        d=google.com; s=arc-20260327;
        b=fxtPlXEB3kdhcICJQ4E0elGzvu7t7izGP4GlNQwM1oDVC7ERYrfMutwNjtx1RR1tim
         F16icLyL5HneXrA9ZpLOT3V2n8gnTpoiuQzeOabg6KpsA6c5tpSmZVE1b21Qy4CN28L7
         AcM0KBbSag/K2S+WxTYJOuTQFK8mWLnAiFGRpgiToxmzjKeCNHKxlWkKQVkWBkt8s4y8
         CTArHxt2b7pGZpryAtU7UycpMUtfTnJ2ceDBC+B9GqvbNTmADBnRTVa/ZwWITGkREyw4
         PImZchcTqAysYYPRaY+TCMOMYZmuaOuJ4vI8kQ6PtHn6PMSFpq/s+iviPDM1IhqhRrH7
         0HqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qYHjr2R6yzGJobd36TyCKi/hQkHTd7qVJrjtZbJ3NQ4=;
        fh=Anwo+kEj+ycHNIQKxHtsTTo6w9/G84pzlUazSrPQMj4=;
        b=Lj0YHW/nsoobGILRBkyqxgUfgs+qfVUDg//KQi8xsra34JbFhVuJajWpTOFIQ9zo8K
         Ja6m4AFRcEsi6pik6/WDfYtyegnIUF4ndHTDGwHvWParTaa/e8GVkuqwXFtn7Sfb4QLw
         x1gSE5Dh+X63ysku8mBT8oc77vNiPH5zVllSvGxldw9qM+lTM+vDReN+hC4slfSp8B1D
         kiNdKFIcxYw5Vbm9sPDF6TGAMGLysYGTlBjcloT1qrhB/iYIDJyFxN/CL+u2RQNhTHZC
         tgEKRi0FsWCgPoj2Y0mOc34V4nQ3YhK8mZ/xCMFPfHefaE1e8TiH55EwaRJGik1We/3c
         UsQA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1782459967; x=1783064767; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qYHjr2R6yzGJobd36TyCKi/hQkHTd7qVJrjtZbJ3NQ4=;
        b=OMfdV3OAhTyXum0Kxctg+Fs+l5bwcWMLUFZDlsmuFqPRtxtaZZOlyrqEHeABJKyOf8
         2dopZrYeEBWzo+AaL+P6vPNfoS13hZmkN/p3RRfMRw4vUKuvzSlJzSgyiIvYsrlO+994
         GD/IIWxfTrhg9/kcs4ftkD+MVYrvJYJKj8lOI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782459967; x=1783064767;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qYHjr2R6yzGJobd36TyCKi/hQkHTd7qVJrjtZbJ3NQ4=;
        b=NSs6hX7/h/8QODKr02K9Y4WrRpdd8u+DxVxYZ7mjVFr3mkFoDgnOUTkBUV+xD7u/2w
         GzFit1Wxqy9qu3z9xXor6ZYBPP3qwxiX6C6rFYZijidbzjiWGfZhEn0xYkPmOiMDDod5
         L9a4KolQ5fBRXg83CtPdVZMFwIckqP4PXn00VDLIIdaVdAu4LJoEtY1+efdV3QCkXvP6
         dk003VkiY83SaWCoziGsWeTEVkplIgUuReVRmQ3W4gAHrH2bCduvaiAfPO413Plh5JFr
         XMzzmoPNFlAspWGpv/XSayjygakYDzWgdrVW0XJ5ZtpDLdRuJWF0ntBngcNprPlGNZz/
         xyYw==
X-Forwarded-Encrypted: i=1; AFNElJ/YOp4xs5haoogHBmPIskDzMBhhXAQePgtBbblXpml9YtPZUpBZalFA5dym4UY/GpqC9GmaJido99QqsndZo7c=@lists.linux.dev
X-Gm-Message-State: AOJu0Yyxx1ONwK20Cvaiw4Re83KNGrMU1APl3OpskWHoJzu5LDHvUZBj
	qrchAxIWkDLMJbpjrvaWBSSCukYRHw5Fvygip+0NRAUKxwAojgr60NyEnwnZ8rjtXtO9jPsDcKv
	fab+aqilVqrPgBb67aXc+oUuNwhcvZF169kjg/+/FEuhAjUMV4BY=
X-Gm-Gg: AfdE7claWWBYFh2qbsbqme2zVbHOFI72Y0SiGFp14NuM1obLcB7Gv8RkKunyf9qbSUR
	wy4L74r5C5oCTE6pP9KKa4nIBiMSpjzbwRHn931mS2dTymWEC2ymElaA2a5Wc1s8iZpVG9haziQ
	wtO5ZJLDei4NjzIgdksSqlGdV6IR1euI6xkB2cLZAJytzlTSCu6KOUnqSsO6DDQeG29T+AjWB56
	w2fP+l6ej0WPmkyufdrJ/GAwca2nzBgZjhARzm5ySdjLdyLQe16WzxlPJi/DlzPClmR1qV+mKlF
	3ksjMvUe1/LOfUAiksE7I8akBARLeKHxmajb
X-Received: by 2002:a05:6a00:1c8a:b0:843:2ac9:80f0 with SMTP id
 d2e1a72fcca58-845b3b6a78amr6477163b3a.23.1782459967107; Fri, 26 Jun 2026
 00:46:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260625130056.3378097-1-maoyixie.tju@gmail.com>
In-Reply-To: <20260625130056.3378097-1-maoyixie.tju@gmail.com>
From: Andrei Kuchynski <akuchynski@chromium.org>
Date: Fri, 26 Jun 2026 09:45:56 +0200
X-Gm-Features: AVVi8CfnNN18_cV4KWxghjVfuyk8Cf0MWDJzg3cvfCVLcpsIgv8fA8ehl0R54mo
Message-ID: <CAMMMRMdN7uWGSxXb6wL5ZfuOkSkyQfJk+T46u-Mao6BS3S2XfQ@mail.gmail.com>
Subject: Re: [PATCH v2] platform/chrome: cros_ec_typec: reject out-of-bounds
 PD cap count
To: Maoyi Xie <maoyixie.tju@gmail.com>
Cc: Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, 
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>, Jameson Thies <jthies@google.com>, 
	Guenter Roeck <groeck@chromium.org>, Kaixuan Li <kaixuan.li@ntu.edu.sg>, 
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 25, 2026 at 3:01=E2=80=AFPM Maoyi Xie <maoyixie.tju@gmail.com> =
wrote:
>
> cros_typec_register_partner_pdos() copies the partner PDOs from the EC
> TYPEC_STATUS response into the fixed caps_desc.pdo[PDO_MAX_OBJECTS] array=
.
>
>         memcpy(caps_desc.pdo, resp->source_cap_pdos,
>                sizeof(u32) * resp->source_cap_count);
>         ...
>         memcpy(caps_desc.pdo, resp->sink_cap_pdos,
>                sizeof(u32) * resp->sink_cap_count);
>
> PDO_MAX_OBJECTS is 7. source_cap_count and sink_cap_count are u8 fields
> from the EC. The only check is that they are not both zero. If either is
> larger than 7, the memcpy writes past the end of the array on the stack.
> A count of 255 overflows it by about 1 KB. The EC source arrays are only
> seven entries wide. A larger count reads past them too.
>
> The ChromeOS EC firmware caps these counts today, so a compliant setup
> does not hit this. The kernel should still validate these values rather
> than trust them.
>
> Validate the counts in cros_typec_register_partner_pdos() next to the
> memcpy. Skip the PDO registration if either count is above PDO_MAX_OBJECT=
S.
> The rest of cros_typec_handle_status() still runs so events are handled
> and cleared.
>
> Fixes: 348a2e8c93d3 ("platform/chrome: cros_ec_typec: Register partner PD=
Os")
> Suggested-by: Tzung-Bi Shih <tzungbi@kernel.org>
> Suggested-by: Andrei Kuchynski <akuchynski@chromium.org>
> Co-developed-by: Kaixuan Li <kaixuan.li@ntu.edu.sg>
> Signed-off-by: Kaixuan Li <kaixuan.li@ntu.edu.sg>
> Signed-off-by: Maoyi Xie <maoyixie.tju@gmail.com>

Reviewed-by: Andrei Kuchynski <akuchynski@chromium.org>


> ---
> v2: Move the check into cros_typec_register_partner_pdos() next to the
>     memcpy it guards. v1 put it at the top of cros_typec_handle_status()
>     and returned early. That skipped the rest of the status handling and
>     left events uncleared.
>
> v1: https://lore.kernel.org/r/178229037114.3009621.14045345257767446805@m=
aoyixie.com
>
>  drivers/platform/chrome/cros_ec_typec.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/drivers/platform/chrome/cros_ec_typec.c b/drivers/platform/c=
hrome/cros_ec_typec.c
> index c0806c562bb9..50a68819ceb7 100644
> --- a/drivers/platform/chrome/cros_ec_typec.c
> +++ b/drivers/platform/chrome/cros_ec_typec.c
> @@ -1119,6 +1119,12 @@ static void cros_typec_register_partner_pdos(struc=
t cros_typec_data *typec,
>         if (!resp->source_cap_count && !resp->sink_cap_count)
>                 return;
>
> +       if (resp->source_cap_count > PDO_MAX_OBJECTS ||
> +           resp->sink_cap_count > PDO_MAX_OBJECTS) {
> +               dev_warn(typec->dev, "Invalid PDO count from EC, port: %d=
\n", port_num);
> +               return;
> +       }
> +
>         port->partner_pd =3D typec_partner_usb_power_delivery_register(po=
rt->partner, &desc);
>         if (IS_ERR(port->partner_pd)) {
>                 dev_warn(typec->dev, "Failed to register partner PD devic=
e, port: %d\n", port_num);
