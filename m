Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF6F130DD11;
	Mon, 20 Jul 2026 02:57:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784516223; cv=none; b=sf/wQt4aR/qiyJjfMrIg4yXgln1KqGbTQjm9yifleh85XAh9VfZNs2IBLCPaTNtM3DuubjMgkpZ5osfQAgC5cyV9BBoKRekNLPm9Uy/fihF0TdQgi0+NBDX0sP6p3AHCt25a5/+Da4+0tCnTRZaDEUtT8qLu9nGF1WfmsCgjbtg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784516223; c=relaxed/simple;
	bh=LA6OaJQJRJhXYB6grHY28WStaHkUd1JJU7O2ZraLwHw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r06Tyh9ecKosgbL41lxe55EQubqo+49/GOTY9zIdqDhV/rxF1zIzHxptyS3xYWyFgr80ikoXdy0zs4tNEQQy9aUg8iP1IiRXQ+DNr4/wpyUOwGUcvxdBaFJ5mO3jEBcLaLF7JnOgCRihqguNMFX8zUIF+rsENQrAkvRrLjUQl7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e/t6H6mD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e/t6H6mD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1AE411F000E9;
	Mon, 20 Jul 2026 02:56:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784516219;
	bh=Qbx5qDrKVVFX8JLIdlQxs1z8Qdrbh8mMeBmWWYN71Ho=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=e/t6H6mDxfasRleLXJEzYkPoR3+awXQ+abcgC5MY3FtZo7bdsIz43XYec4LbkVkkW
	 rIYLv/Vs+mZ5gHmjwqrkH7pfEBae9VUoZpuzdj+EiEG+zEEw9yw5o29abg/JeCZUjl
	 q2TjXUxZhljmquQPzoaVkqpco7wxqwFw3Brb4OjA85r5Y9cz5Gb89TBG5UZoNoOsTw
	 AKAWxM5i0rVWxSOjEPf0qzk/+O9Bx48A3z7F8Txx0wt9L8yVqcCpUY/oWh/FN19H2m
	 itfOyJnpB9lk2Zg9z5WFHOD96wmW1XGbn+9mWV8mO5nJ1Wlz46WKYOjo8CHmT1nutf
	 LREhVzDJoNhlw==
Date: Mon, 20 Jul 2026 02:56:56 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Hsin-Te Yuan <yuanhsinte@chromium.org>
Cc: Brian Norris <briannorris@chromium.org>,
	Julius Werner <jwerner@chromium.org>,
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org,
	Yidi Lin <yidilin@google.com>
Subject: Re: [PATCH v2] firmware: google: coreboot_table: skip no-map CBMEM
 entries
Message-ID: <al2OePSmQNG5zkwx@google.com>
References: <20260717-coreboot-v2-1-8f8b389e3758@chromium.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260717-coreboot-v2-1-8f8b389e3758@chromium.org>

On Fri, Jul 17, 2026 at 08:41:26AM +0000, Hsin-Te Yuan wrote:
> From: Yidi Lin <yidilin@google.com>
> 
> On ARM64 platforms, certain reserved memory regions (like those used
> by pKVM) are marked with the 'no-map' property. This indicates that
> the host kernel is forbidden from creating a structural mapping for
> these regions.
> 
> The coreboot table may describe CBMEM entries that overlap with or are
> entirely contained within these no-map regions. Attempting to populate
> these entries as devices and subsequently remapping them can lead to
> system crashes or security violations.
> 
> [...]

Applied to

    https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform/linux.git for-firmware-next

[1/1] firmware: google: coreboot_table: skip no-map CBMEM entries
      commit: e31ecda9e3af675bc05039f0791a34a46c27f253

Thanks!
