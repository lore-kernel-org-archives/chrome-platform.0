Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2105930C371
	for <chrome-platform@lists.linux.dev>; Mon, 26 Jan 2026 10:25:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769423141; cv=none; b=QMO0GBljUYahrn6zq8/Sj61R5LKb06vS/+dQeRDQnp3KP891WVMhxaW4RYe46ijt3L3CH2ziQA3KwYL5PHCN8s79eKfN9wM8S8yBCskP8E57QIsnw8W6YHAvrT5gGbNAiO113QtQlzuV5K4hnehs2AP+aKfQWZmDDUn0yw+8tTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769423141; c=relaxed/simple;
	bh=H2gCYA0i3pdcG0Z7QlUteTKchAelo+ySaGCzZiiS5yQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cIG8QOcc25lU/sjGJQf+h6+huodvHUG3LDEXMjNseaZGaFsniqIZbJYpTT7TNc4nMmJhSKPVj5gRUg8MvNwxfxoKGqqZmLhCyNhDd3/BFQibxzSYxJ/bBvFgYU3sL4xbonMsSDOdnUH+vZqZ8Z1Hx5RwsqVMVBEyMFWNuY18Sn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SfBmE2fG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SfBmE2fG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10A1FC116C6;
	Mon, 26 Jan 2026 10:25:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769423140;
	bh=H2gCYA0i3pdcG0Z7QlUteTKchAelo+ySaGCzZiiS5yQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SfBmE2fG/h7nd5mxjQEUx8YN5GuGZgAxiUAPI/x/DteceA4PI5ACdaLZG+Hh+H3Af
	 RaZ2XqZEmOjjT6/Bgqq887E5kB61TkD57j2CXA5ILIr0wOQuxkXWyNX/TTM7I1G2rH
	 JAm7z8ffxWDJeBErxyiAAeVa3le7YR0jHErIjp/1exaEw7yd4iZf3Rs1dMV7UhtiWn
	 qTUBhl7nPMxEWXeFspbbVUtMHgJFsGgfNBnp0qUxCpeoLCAOw8cRPRvoElomzhyb57
	 DDz6K2QoTqTlZ+HL9TwvMOZii9DMmjm0O1qjo+DBbxxLB9DLFM9ICO+mf3T8nQcr3R
	 3AxFEfWOzIAVQ==
Date: Mon, 26 Jan 2026 10:25:37 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: briannorris@chromium.org, jwerner@chromium.org, javierm@redhat.com,
	samuel@sholland.org, maarten.lankhorst@linux.intel.com,
	mripard@kernel.org, airlied@gmail.com, simona@ffwll.ch,
	chrome-platform@lists.linux.dev, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2 08/12] firmware: google: Export coreboot table entries
Message-ID: <aXdBIZJYQ9L_M5Tq@google.com>
References: <20260115082128.12460-1-tzimmermann@suse.de>
 <20260115082128.12460-9-tzimmermann@suse.de>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260115082128.12460-9-tzimmermann@suse.de>

On Thu, Jan 15, 2026 at 08:57:18AM +0100, Thomas Zimmermann wrote:
> Move types for coreboot table entries to <linux/coreboot.h>. Allows
> drivers in other subsystems to use these structures.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Acked-by: Tzung-Bi Shih <tzungbi@kernel.org>
