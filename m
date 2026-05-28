Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FE1D1C5799;
	Thu, 28 May 2026 04:33:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779942800; cv=none; b=BT74+gAsDeHprXdGNeMNVVHEsSG8AM5p4Oe3WNFASqBVzto/rz7OqoXV0raxPyxYU0UtXpZJeNc+m1EIAawVocJDlRPp6WCbokSlz0qWko7jdFJySJTnvZzqOoCTCCH8QadWiCv5diFHnCrA93nWqLRUldNU7LonnA/gnY2peJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779942800; c=relaxed/simple;
	bh=pNsYmjNN9G0QN36bB1aBet1PgwGgBL1YeBjFc+n0ipc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TpnsYe6NRCTD6mZ649rHZigGgjwixXaFb2MJkQ8iKcL+IrgI5oUW2LAoIZ1MKhIZ8i8rGLe0d86BWWfwN/11R7tGjKd5pkTWR/wN8+Vimj1Ac+qPNVt2xf5MV2gsR2hrF/YBTpYw729H6YSQDl7ODaKSqoD67D9ihqR4tUk6v30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X76P/YfT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X76P/YfT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E70D31F000E9;
	Thu, 28 May 2026 04:33:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779942798;
	bh=7JyrCj2XCaxs6aVnKXhEVBKVSMSYIvfRzy9v1NZYHh4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=X76P/YfT0up65hupkv8R/7TQTi9uFzk7ufwALyKiSeht5pgYkZvbwZLE4RQYPD+hQ
	 SGgBaRpa3sFj1PHKSManiewlFyLdxSf3wJM/ReU+VtTZPpzBeulvrAxlnemqkHDR27
	 6e+YuI1PRC93IgCn1pVXuGV/Jx1u0EWoaRODFMXt+bGcB9a0ehHemnU7MfPago5iRK
	 Nyx+95/CEd9AX8YaZOX+AltjjG11k0Y+NbA2ovTTjMo0J4BeOdQo94L59ud/zwCInP
	 oGSELgrc0jQ0y/d/46z+BSBH5HIQ87sGtmowF2ryjjhGOzHRzGYS/zyleKYfcuSpH6
	 Ja6rxsNfbla6g==
Date: Thu, 28 May 2026 04:33:16 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Benson Leung <bleung@chromium.org>, Jason Gunthorpe <jgg@nvidia.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 4/4] platform/chrome: cros_ec_chardev: Introduce rwsem
 for protecting ec_dev
Message-ID: <ahfFjKooNDyOP6Zm@google.com>
References: <20260525052654.4076429-1-tzungbi@kernel.org>
 <20260525052654.4076429-5-tzungbi@kernel.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260525052654.4076429-5-tzungbi@kernel.org>

On Mon, May 25, 2026 at 05:26:54AM +0000, Tzung-Bi Shih wrote:
> diff --git a/drivers/platform/chrome/cros_ec_chardev.c b/drivers/platform/chrome/cros_ec_chardev.c
> index 7e046fc56998..25ad409523b8 100644
...
> @@ -219,6 +229,10 @@ static __poll_t cros_ec_chardev_poll(struct file *filp, poll_table *wait)
>  {
>  	struct chardev_priv *priv = filp->private_data;
>  
> +	guard(rwsem_read)(&priv->pdata->ec_dev_sem);
> +	if (!priv->pdata->ec_dev)
> +		return -ENODEV;

FWIW: I realized -ENODEV isn't a correct return value for poll().
Return EPOLLHUP instead, and squash into the patch.
