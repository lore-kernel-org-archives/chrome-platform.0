Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C6F73D349C;
	Tue, 16 Jun 2026 05:53:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781589204; cv=none; b=k5UbunbL5NvXbSADb7YVVtC2QGsWM317gZy89wriZUDG5nM84fbLIc4iIx8i0VNUbx+QmkkkUz+tsVUgkCaSHlq5q3SEigNQFajcfK+kff1qyyP5gwYf93qZ2+XQJ9q3LCLzpt2j/7Z6dimIB1WEVZJf6dXSApwloDPZNN8LNH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781589204; c=relaxed/simple;
	bh=VRRGUudbG1nIC/Eaj1Sjayy4jvuaGxXfsOKJ9uSFfCo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fuFMNlAve/vbKKp3iXFvQEyjRBdxZ7g/jo3r8aIP84EzZY0Gz2VUNcUDAxEfWp7w04aMmmHq3kcJtrlVdPAlWVuq0M6QIrwOO90CGI9T1G0yEeZykdASMy1CAaR4jhbdDxvzH2RCEu4S++h8lWz5p0IVWT5GJGsFJvUOlJnO/00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WaPzliom; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WaPzliom"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 809051F000E9;
	Tue, 16 Jun 2026 05:53:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781589203;
	bh=l0EJXSL3LBiJuSpgmXhvnq9TpjbRJyoh58Oxso/pRzU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=WaPzliomXUDXfNGLEQQRLjp5R01i9n7EiJ5MWCVnfzmAeFoiqb/setXd+hl+bJErF
	 Z/dhrgTZHYc+xIwp9S9tXIFKG3dErJqMDx2yamp0S3I0dCW4E2pIJx1q369Lct1W10
	 eqy/YspKqlk/5VYvUGcP7eQN/VZeJz1iJdOAuNcKY//s7SrlfyoFTkVf5UQz1F6t+S
	 ZAgmrwaMMoPqrgMlmiUophm74rgxzZ16/3ksYeIOWTuD/tLXQohzOrxqlQ73NqQMuB
	 8iL0+CGDhOILnln4eUmdJfQykDq3/r3oYk/kGIzhG7u487hKtQBwJjdGhi9z1x8Gbe
	 GZzMdV52ttvBA==
Date: Tue, 16 Jun 2026 05:53:20 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Pengpeng Hou <pengpeng@iscas.ac.cn>
Cc: Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>,
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] platform/chrome: cros_ec_debugfs: unregister panic
 notifier on remove
Message-ID: <ajDk0KvY61EU7S86@google.com>
References: <20260615063200.43185-1-pengpeng@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260615063200.43185-1-pengpeng@iscas.ac.cn>

On Mon, Jun 15, 2026 at 02:32:00PM +0800, Pengpeng Hou wrote:
> cros_ec_debugfs_probe() registers a panic notifier whose callback
> recovers struct cros_ec_debugfs with container_of() and can schedule or
> flush the console log work.
> 
> cros_ec_debugfs_remove() removes debugfs state and cleans up the console
> log buffer, but it leaves the notifier registered.  A later panic
> notification can therefore call back into freed debugfs state.
> 
> Unregister the panic notifier before tearing down the debugfs and log
> state.
> 
> Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>

For my reference,
Reviewed-by: Tzung-Bi Shih <tzungbi@kernel.org>
