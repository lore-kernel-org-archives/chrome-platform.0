Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F9514C6D
	for <chrome-platform@lists.linux.dev>; Fri, 18 Feb 2022 19:05:30 +0000 (UTC)
Received: by mail-pg1-f170.google.com with SMTP id 75so8651278pgb.4
        for <chrome-platform@lists.linux.dev>; Fri, 18 Feb 2022 11:05:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :in-reply-to;
        bh=gAYCaWD+I/5K7T2tY1uj7IQZc8/qTYUQZ9JN2xJhQy4=;
        b=gAl9ea7y7aDGUd4LfVvv3BJXWteUiBzDwBBMcqfslZjfajCoSQyAVgItifUxFcWaYX
         KRrjUr27HznusZuV3/OdhfGFKFQH4zIezhJbDb+IK4NEQjPQ7SMLA+1fYOpdsZaK9EtG
         mdVHJM1GeW7YwgjhnHHQC0eiWb4oyTotu9PT7mkHhjPHClZhGu56QO5KKKqE6GgAF3/I
         m4BvBuBE3IMuhY4Gc1H/PfnqSpSmyaEXf6obxBgcjuJaKnxdA7CND3VHYhT4+Xk5S1F2
         hfH24o6jwwoZbA/Uz1SkGrNmgdKECC0zqSjBggjqeruQBnczOmAkV72YCJ0hsbOog/9U
         6igw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:in-reply-to;
        bh=gAYCaWD+I/5K7T2tY1uj7IQZc8/qTYUQZ9JN2xJhQy4=;
        b=wZvEkWUQEwmDikCOGBHeJcExMTtegLzXn+ICxltXUedSTQoqQ4lRALqHKDV6C4TED6
         n2lEBi4GNc2z6yTZb2QFGEswPOC/XxsQ1MONqWWw4nD8itBzvs0MMxldAujTNwtcysuF
         QRi01LCprSQYb648HVr/Di01ImrIxszaKbOAwQFOOINL6XowM3ySWVms+fGKaFWLULaG
         mvIocPAQv4lfzom7WG7pUkq2RzM4E/xC9BNT+aYSa4+kn5OyjJhcq+7ZzIbL1cPlFPv6
         ymUSwSUShflipTQ3BRtICBjagJ3N2YRHfWuoaAMb60t7hqjm6i1dv3Q5Y1A0KyVQ0k6b
         1AAQ==
X-Gm-Message-State: AOAM530h6XqpvfkunjN+IjxXC4L5/z9MIIrvaDQ4RNxnwWW03AE6BZIo
	ndxhcGKIu8X7uEnSxyvcqVCRUQ==
X-Google-Smtp-Source: ABdhPJxnvdoJHgx60zJ/iaEPQHfenzIfbNpW6GsLihAs6cCbbcEtiqvZx3lJAuB5FfXCkeirikv8rw==
X-Received: by 2002:a63:e249:0:b0:36c:4f1f:95e0 with SMTP id y9-20020a63e249000000b0036c4f1f95e0mr7455930pgj.381.1645211129155;
        Fri, 18 Feb 2022 11:05:29 -0800 (PST)
Received: from google.com ([2620:15c:202:201:f0e:4aa7:e49d:40ba])
        by smtp.gmail.com with ESMTPSA id q32sm12117689pgm.26.2022.02.18.11.05.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Feb 2022 11:05:28 -0800 (PST)
Date: Fri, 18 Feb 2022 11:05:22 -0800
From: Benson Leung <bleung@google.com>
To: groeck@chromium.org, Gwendal Grignou <gwendal@chromium.org>
Cc: stable@vger.kernel.org, linux-kernel@vger.kernel.org,
	chrome-platform@lists.linux.dev
Subject: Re: [PATCH v2] platform: chrome: Split trace include file
Message-ID: <164520969269.1961415.11106993009131121558.b4-ty@chromium.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="kdTR9wP4hx2yOsAa"
Content-Disposition: inline
In-Reply-To: <20220122001301.640337-1-gwendal@chromium.org>


--kdTR9wP4hx2yOsAa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Gwendal,

On Fri, 21 Jan 2022 16:13:01 -0800, Gwendal Grignou wrote:
> cros_ec_trace.h defined 5 tracing events, 2 for cros_ec_proto and
> 3 for cros_ec_sensorhub_ring.
> These 2 files are in different kernel modules, the traces are defined
> twice in the kernel which leads to problem enabling only some traces.
>=20
> Move sensorhub traces from cros_ec_trace.h to cros_ec_sensorhub_trace.h
> and enable them only in cros_ec_sensorhub kernel module.
>=20
> [...]

Applied, thanks!

[1/1] platform: chrome: Split trace include file
      commit: 4c288c88d0169120a2de6041c81017585f7ee556

Best regards,
--=20
Benson Leung
Staff Software Engineer
Chrome OS Kernel
Google Inc.
bleung@google.com
Chromium OS Project
bleung@chromium.org

--kdTR9wP4hx2yOsAa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQQCtZK6p/AktxXfkOlzbaomhzOwwgUCYg/t8gAKCRBzbaomhzOw
wqpRAQCb6ibNDwJShPC0QeefgTWSXYYf0/3CkRaMSUm36OyfWAEAqc00squXgI2r
WZDX57n6wR6eFpN4EoWgLnzH8rGL5wQ=
=MnDv
-----END PGP SIGNATURE-----

--kdTR9wP4hx2yOsAa--
