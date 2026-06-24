Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BA5A3AEB32
	for <chrome-platform@lists.linux.dev>; Wed, 24 Jun 2026 12:45:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782305152; cv=pass; b=R9aO9lA7MMLSShr8vOPeo4xhh6saQD1W/xxuL62LwFZ56iVj3gCK5BNXxWzAwgoIRWTgJiBoftuXybooTBwQP7dOFJuDPposguaH6IzgQ1ENq45Gn7wOzfSHRtx3CW4SV22x+n04T+3x7VJ+o2Fi7J3aWz4FhyABAd7HmcFedyM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782305152; c=relaxed/simple;
	bh=EZGdAXD8AC8mknYFMcsB/uJxKdV4diwfbm79jPO3tlE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FcwzG+B2ppxT2alSJ8fIfgFnFM456YOCB1SkN/B4UK292hgJ+0iMpsGBatTtUJaHN8CGL7p/pqmcn9Wzzn86mHTSXKRX8cMjQ9U+xz9YSw4iVlTwT2L7wQ/CC9IFeGgVrYmV+YhjgED0gb0hwfIX5xg1EtSU9J67bJZBhazcYzc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Dv0S4xnm; arc=pass smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Dv0S4xnm"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2c7f123b1acso1457595ad.0
        for <chrome-platform@lists.linux.dev>; Wed, 24 Jun 2026 05:45:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782305151; cv=none;
        d=google.com; s=arc-20240605;
        b=CNdypEaLw2jm1Behwf8KKuNt/y+gyQbarsjj3wzywxy6mgAgUu0B3imPw3NBiP8j8b
         IVYMvPNF9tKUYq0zQmqGQMkLg/nHEYCtwuv08sJK3H0JE6lWsB3SMD07yZOor9mDOk/j
         Y6NnD5WB58fYUz7+eDYzZG5HZX25ngWJ+Cgnpg3bDwcuegEW2OZ60y/HQMWqv2Zk3Jn6
         pHFcyT9klJ4RPtGO8Im1lP45Fqt6UNsuD4pmL59uro7D9G8mk1yP4CLwBJuy0FoSuzOA
         q3aR0ehKJammQgY08EeWgpY+OE8fxPdv9d7wKht3lmkiicKKoopq0BccmX/YrTbMQKjY
         v/4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jmddAwpIwpgrHis+UDB/HM7L+PSMnWilzSJCiOaNJ9k=;
        fh=oPuiZyl757StYmvt+qc101kTDoRxXxJoLSnMR49pPD0=;
        b=WGJ7beOFSeeBBBPJrmyc5XmV2iRm7jwmtOPbGXAsLMtw5BDfEcDXsRdgrEKWCNquy1
         WigD5EKn9KWGEYmdmusO8X0DrEe1u8gTEJ6pDsVFRUULozqounm27DXxlaVBj2eg6tsb
         sRH9y4EsFJK+7fUk6I+Athh7kfL3eP0tSP8dzttvkI2bANLBhfxKphmHkxptvAfiKKDD
         eTNzRsGSr02jpe+sMBGqnYsqQRw3FO7sRg3tVA71LCByhdOnErJx4Jwhy5JSQt0BLpXh
         XHyFDufwXt7YXM7xI0NmSfmvYsHGRU9s6nmnMVckv2Fy8MFAYWV3uNxXO/ONES+IDvwx
         SsTA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1782305151; x=1782909951; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jmddAwpIwpgrHis+UDB/HM7L+PSMnWilzSJCiOaNJ9k=;
        b=Dv0S4xnmbin3oE3KQ1cjlRb+vrgFLKtab8mlpvl+TIrmVomh7chd/W3LDNS6lL3LHj
         YQxyZ2qopJAFkUtwC2xJl66UP/zrUdw/Hoz5Bzd2EhJ+aoY41gZaVS33M5CycsK8fvlQ
         5UBhFknT1ihpcemG3YU/C4kC7jdHkZ9rG7pRI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782305151; x=1782909951;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jmddAwpIwpgrHis+UDB/HM7L+PSMnWilzSJCiOaNJ9k=;
        b=bnLy6THqNK5948i1KBynCdysg+Wgv8Xqag1xFsmCNKaNUnVfbMw2iLLBRo9j27EFgc
         0bHhIqPc9GmvPovfoWH8tTDquzKM94lgPB2Zihr7aVqUuXMhbG4ocq+pU0SQmlBWmrfV
         WIHW+fK2TItH3XbcUXqiVddNVW0wIwejjpL/ZLpk54hECl3GsdMeXWj/cGFzGRbLtpiO
         km+tFzIifwEk0R3/pmk5pKGAtZIIVunf6QhT3L5us2aL4ajDCnzMOBqNIGxmBFC4j/Xk
         JWbaLnZvcuTd0AyuIfAiOmZHsFjQ9iZ2Df7ns77GhScK3QRJDzcSd/31K3+K4wq9RW9v
         LW5A==
X-Forwarded-Encrypted: i=1; AHgh+RqUiHDk3X8NifkKsgxWFiL4JVJZ912f0bFneR7RRvEWcFs2uLlqPNCo9oAuFcuD+aczdDSr1MBfa3sUtRA+JyQ=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw/Qs0lisqZbeQz+ARROi+DOdfIWNhTeVqisdTmNqLX7Uy7lz/9
	Bkl3sFPMsLSIPfm6ka+js4ptI3DsldYy/hIioHcjUfJ48UoShP2oN5sAEcNTd5qNFExZlW4yNve
	XS4wc7fg3p/PPCRO0EMNiKbLvEk0dP6VKrxwMz9hE
X-Gm-Gg: AfdE7cl7fC9ul9Ny0TD0p36KBsbkZuzGRZHmF44DHrI/86jRVNm6rkmZ+RzsZVPxfOZ
	3Y239LaUsqMAytj2uyOnQrv92RfhHUKq742yug5kTJPp3JNiPXtmASeV0oCq+85798lC0cYw0rI
	VFZzE0mWkUVz5/xc+at2maXG282tGzjO6C2HpcGG/tMvNJ70U1cKcqShFvg3RjVycIyoECLrTs4
	8TIxENVe9kah2Qf6B3KLjQN7Hy2OEfBmv5Nw5fji02CLWQ/Jy/DVsYyGrUw3gb6ZhvQdCnm60tY
	4G8eujCTWd+mYoE1ZEU4/rw1mNA=
X-Received: by 2002:a17:902:ea12:b0:2c0:d8ee:7d66 with SMTP id
 d9443c01a7336-2c7e16fc5d9mr35949105ad.36.1782305150778; Wed, 24 Jun 2026
 05:45:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <178229037114.3009621.14045345257767446805@maoyixie.com>
In-Reply-To: <178229037114.3009621.14045345257767446805@maoyixie.com>
From: Andrei Kuchynski <akuchynski@chromium.org>
Date: Wed, 24 Jun 2026 14:45:39 +0200
X-Gm-Features: AVVi8CeFaAKzXmiF18CqI3RXWvdYJt_86HVmPxH2qzuOuvHW-2XXXxISfgakDsg
Message-ID: <CAMMMRMfO5GgoBGn6iDa_ZNXP6Ppm99PLAVQySc8V46QEeJR+HQ@mail.gmail.com>
Subject: Re: [PATCH] platform/chrome: cros_ec_typec: reject out-of-bounds PD
 cap count
To: Maoyi Xie <maoyixie.tju@gmail.com>
Cc: Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, 
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>, Jameson Thies <jthies@google.com>, 
	Guenter Roeck <groeck@chromium.org>, Kaixuan Li <kaixuan.li@ntu.edu.sg>, 
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 24, 2026 at 10:39=E2=80=AFAM Maoyi Xie <maoyixie.tju@gmail.com>=
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
> from the EC, and the only check is that they are not both zero. If either
> is larger than 7, the memcpy writes past the end of the array on the stac=
k.
> A count of 255 overflows it by about 1 KB.
>
> The ChromeOS EC firmware caps these counts today, so a compliant setup
> does not hit this. The kernel should still validate the values from the E=
C
> rather than trust them.
>
> Validate the counts in cros_typec_handle_status() right after the
> EC_CMD_TYPEC_STATUS command returns, and return early if either one is
> above PDO_MAX_OBJECTS.
>
> Fixes: 348a2e8c93d3 ("platform/chrome: cros_ec_typec: Register partner PD=
Os")
> Suggested-by: Tzung-Bi Shih <tzungbi@kernel.org>
> Co-developed-by: Kaixuan Li <kaixuan.li@ntu.edu.sg>
> Signed-off-by: Kaixuan Li <kaixuan.li@ntu.edu.sg>
> Signed-off-by: Maoyi Xie <maoyixie.tju@gmail.com>
> ---
>  drivers/platform/chrome/cros_ec_typec.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/drivers/platform/chrome/cros_ec_typec.c b/drivers/platform/c=
hrome/cros_ec_typec.c
> index c0806c562bb9..3ae9b35b7d85 100644
> --- a/drivers/platform/chrome/cros_ec_typec.c
> +++ b/drivers/platform/chrome/cros_ec_typec.c
> @@ -1158,6 +1158,12 @@ static void cros_typec_handle_status(struct cros_t=
ypec_data *typec, int port_num
>                 return;
>         }
>
> +       if (resp.source_cap_count > PDO_MAX_OBJECTS ||
> +           resp.sink_cap_count > PDO_MAX_OBJECTS) {
> +               dev_warn(typec->dev, "Invalid PDO count from EC, port: %d=
\n", port_num);
> +               return;
> +       }
> +

Hi Maoyi,

Thanks for the patch.
Are we only rejecting `out-of-bounds PD cap count` here?

>         /* If we got a hard reset, unregister everything and return. */
>         if (resp.events & PD_STATUS_EVENT_HARD_RESET) {
>                 cros_typec_remove_partner(typec, port_num);

Thanks,
Andrei
