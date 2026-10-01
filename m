Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75E4452845E
	for <chrome-platform@lists.linux.dev>; Thu,  1 Oct 2026 15:39:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.141
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790869202; cv=pass; b=hvGExLZG9pBS4q2orZRr/thnFKpcCiogyCMqAQJzE8aTTj0OSjb8hc25jB9CPbCLDWZTXrhjS/fnFN6UHQ4MGwD7/xP4X3dar3B+e9NVB+GAxCuBaVOzeWdWD+hJNTU7s7V6cdMunz+tIs/1Oq/K/nKQuwXOxPuiDwJAEa+iI+s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790869202; c=relaxed/simple;
	bh=aFUh89Vb7GZ4oVyB3fXPOwsUThKEK9z+VY4rNdjijh8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KWFMHFTZU7aEE68J4722O5fB6SmRaCz8UxSqdgSZ2tJx9+wvXX8DjgMY3Mxq+C+j3WTtTvn2yk9R4RV9lEJdIvY6kJ8EIdLScItkwpru9No5uytkkfNFEDjfk3K2g0alfXF/8Faa2OdGB6Q/e/2/brpsX5GSJRAmtTFJr1ANkOo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=MrExPzeX; arc=pass smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="MrExPzeX"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-396ccb65437so4022955a91.3
        for <chrome-platform@lists.linux.dev>; Thu, 01 Oct 2026 08:39:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790869199; cv=none;
        d=google.com; s=arc-20260327;
        b=G4FXXbTADBdCeVD34Xt0xVixVfQoQo7Z7c5v0t8HqzEbX2BYY6ruHUSREiZGRKSR15
         GWmJCunYm5M6CByFxrUvTQ1oTP3xYGBr/JYgG6yNaJZP28LvSTYXzElj97bZIds4c7Ew
         GOg8nk6nlIswGFqiJn+guqnscee3+B478HJyLHv6qBTSQRwWlYKTnjNBPQbGwvQzaNam
         iWQEO2lYDELr0Ollu8OOft2cu27e15LQyTL5FsEzLRDHF9Eo4z/L81bn45BbqmNgfJNO
         8DM3rZ0biW54o7vk+A8LqWf+RuQAhJz3lXJmG7nimE1YVA8KK9MhmLg6Wp68kfRzeCa4
         BgOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=33ugh1JWMcgP8/UF4U5Kxe1xOXj+ElXNCs++vic4Ae8=;
        fh=KiAZIbrXkyN7FCnM9tmW47TGDr3BC1z5NqDTYpLJBIU=;
        b=ehvlUaySJGgu/bTbVVW8AF7xRMxmyWRXcp5vC6Pxltds7bCvooI7QfxhWliHKcA6Kl
         j2DJeihaQJYiwDp+WP+X/1VsQBwKYy2svJhxGk53F0ECFWeh37rbx5/ybeu5Nrk0zNLy
         SHg/LUcWQveOUZWPlxV48KM5YQ5tZ/bxbjahYzuqpsNqZC/B8BCPg5efCOzz7lx3na60
         pDc0MKmigzRRRBIkHHPqYG3qI/i/QzuiFDnkyMwAOe94RypOUKLnulQyZjpEYtfnqH2g
         FIXJrClxCQe/67DijXKEM0PCuGWVjRpCWzIH+XPdnUMmmWx9ryA7LJ1C6Dl/ZwKv5Z5B
         77qg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1790869199; x=1791473999; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=33ugh1JWMcgP8/UF4U5Kxe1xOXj+ElXNCs++vic4Ae8=;
        b=MrExPzeX/TkOlO2ESbJ/58LI7dOtXRTWCRSlRv8U5J6MlnLJCeln6yoGeWpMLjeLcJ
         PzKn3lu789+EHRvaVBqppqptbEf4jFeetA/faLWnKx2wPBv4fnzDZJQpkB0XTxMt0nMd
         z0J3vsqW/bDo6DbdgMEH9oiBmcZfE4GASO+ls=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790869199; x=1791473999;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=33ugh1JWMcgP8/UF4U5Kxe1xOXj+ElXNCs++vic4Ae8=;
        b=Ftb9spDi/gCVtrexUb3jbDplb3soMi85+f8OT3mrwvBMW85rXsFiEVxZ31IU+dlEME
         +xhfdIiFB0vmexkmC87nZd0MjfUhdN50YwXOBtiSa9PoSFaFK3gkgtbTcjlhQi88jUC2
         zObbxLrwN0qwKMaQ1vvaLKhLRGEoPeH6OWGmws/gQNbzRM72dNxuMQLOGdvI3akbt7+7
         yxHNdmUmQxCXOZAGX5SeZ/3rbjc3f3UCU7PUVxG8GX++VcCMffqDkO8eMwOSls2pHyxT
         Wxh57C9d8AgpE1apkDISPUyfUNANqfhgIvwt+FRolywFSo1lKlr9opfB9rCQbadlbprK
         PtVg==
X-Forwarded-Encrypted: i=1; AKwUvBx4bu10chGTUxIY4YDZv+9Qru3bLi28t+JVf+ze+4KOkwi39CYzXtHru3hjw9udolldKSUX8BoSYkA11vEBlK4=@lists.linux.dev
X-Gm-Message-State: AFq9FYKBfPE5W75lWTbZ0zwB5mwzivbeK5D0pTAlNSwkQI13mLNIpypW
	uaQmali8U8x5H/1KFVW64VTDtp8EcdTCHGdne0O8OUHrXmNqJYeOL7V2ofttFSOHpdkYbpdeHdX
	Xg/14DfmKqVzsrXE2UUQo+y1Zx1AhMhXOK/VjII14
X-Gm-Gg: AYBFou2yq+N4mO1Hpi/s2Pv1WM7ea+BsCm55LKIjGOEyptBEsyoOPXJKpLNZTxtLXQj
	XcRcYuoPB5m5g6K2/gDOJnFdcLITrYXeyLxGAKW0s1dF8iqgFo1a3iuG7p45iJWNRy4BgqAZMv5
	S97QH+rZccr5iqCYBl9RPa/lc9OBlfNrYxUCa2gRh4Zt8kBu3smpFVC6nMt2qsdyQOUJJ65vUe+
	YqbNBP5t43BkaQjxM++XQKmiG1uNGaOJs988bJ226xFNtXSD+910qysQE0eSubuHOT7HF64RnjG
	hLZ8nLX+H4NH/RePYYF4131ebyvxwlJzL+q4X46nQ1waOM27Fp6Bxj4Q+8IiQox4Yt44Yf2q8an
	Ml3IVYDA=
X-Received: by 2002:a17:90b:518e:b0:3a4:a619:9e6a with SMTP id
 98e67ed59e1d1-3a4d1b25bd7mr4253895a91.41.1790869198610; Thu, 01 Oct 2026
 08:39:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261001085714.1086242-1-bszpila@google.com>
In-Reply-To: <20261001085714.1086242-1-bszpila@google.com>
From: Andrei Kuchynski <akuchynski@chromium.org>
Date: Thu, 1 Oct 2026 15:39:46 +0000
X-Gm-Features: AclHuK_GQBP6uCoRCCq5xQM-LAx3aYxUTtCIoJedsD2JaykZ72mP6quteNaD6bE
Message-ID: <CAMMMRMcaceQ6YTaARYYYKbB0xvTMr4bW8gbF0Y4-EihrwCNXDA@mail.gmail.com>
Subject: Re: [PATCH] platform/chrome: cros_ec_typec: Validate SVID and mode
 counts in discovery data
To: Bartosz Szpila <bszpila@google.com>
Cc: tzungbi@kernel.org, bleung@chromium.org, 
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>, Jameson Thies <jthies@google.com>, 
	Guenter Roeck <groeck@chromium.org>, 
	"open list:CHROMEOS EC USB TYPE-C DRIVER" <chrome-platform@lists.linux.dev>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 1, 2026 at 8:58=E2=80=AFAM Bartosz Szpila <bszpila@google.com> =
wrote:
>
> cros_typec_register_altmodes() iterates over sop_disc->svid_count and
> sop_disc->svids[i].mode_count from the EC_CMD_TYPEC_DISCOVERY response
> without validating their bounds.
>
> port->disc_data is allocated as a buffer of EC_PROTO2_MAX_RESPONSE_SIZE
> bytes, and each SVID entry contains a fixed mode_vdo[6] array. If the EC
> returns an out-of-bounds svid_count or mode_count, the loops read past
> the end of the mode_vdo array or the disc_data buffer.
>
> Validate that the discovery response with svid_count entries fits within
> EC_PROTO2_MAX_RESPONSE_SIZE using struct_size(), and ensure each SVID's
> mode_count does not exceed ARRAY_SIZE(sop_disc->svids[i].mode_vdo)
> before registering altmodes.
>
> Signed-off-by: Bartosz Szpila <bszpila@google.com>

Reviewed-by: Andrei Kuchynski <akuchynski@chromium.org>

> ---
>  drivers/platform/chrome/cros_ec_typec.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/drivers/platform/chrome/cros_ec_typec.c b/drivers/platform/c=
hrome/cros_ec_typec.c
> index 50a68819ceb7..4427897eb3f5 100644
> --- a/drivers/platform/chrome/cros_ec_typec.c
> +++ b/drivers/platform/chrome/cros_ec_typec.c
> @@ -7,8 +7,10 @@
>   */
>
>  #include <linux/acpi.h>
> +#include <linux/array_size.h>
>  #include <linux/module.h>
>  #include <linux/of.h>
> +#include <linux/overflow.h>
>  #include <linux/platform_data/cros_ec_commands.h>
>  #include <linux/platform_data/cros_usbpd_notify.h>
>  #include <linux/platform_device.h>
> @@ -894,7 +896,15 @@ static int cros_typec_register_altmodes(struct cros_=
typec_data *typec, int port_
>         int ret =3D 0;
>         int i, j;
>
> +       if (struct_size(sop_disc, svids, sop_disc->svid_count) > EC_PROTO=
2_MAX_RESPONSE_SIZE)
> +               return -EINVAL;
> +
>         for (i =3D 0; i < sop_disc->svid_count; i++) {
> +               if (sop_disc->svids[i].mode_count > ARRAY_SIZE(sop_disc->=
svids[i].mode_vdo)) {
> +                       ret =3D -EINVAL;
> +                       goto err_cleanup;
> +               }
> +
>                 for (j =3D 0; j < sop_disc->svids[i].mode_count; j++) {
>                         memset(&desc, 0, sizeof(desc));
>                         desc.svid =3D sop_disc->svids[i].svid;
> --
> 2.56.0.rc1.315.gc6ed9934b7-goog
>
