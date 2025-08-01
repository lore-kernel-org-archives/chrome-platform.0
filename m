Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE90D2AE72
	for <chrome-platform@lists.linux.dev>; Fri,  1 Aug 2025 07:25:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754033160; cv=none; b=Q00B8B1S2dOb6zMsh616YMHAJ/fye819aILO2hf0EQr+uQoDkZAzElMfskFlugkeFhVc+CqC1KjmtXzMKn+bwDpoZuL0ADdZAzZdb93V1vVu6JTt779rLpu/RAMaJLEqIP4LQpvHdEXp9+GE+1BnUmtliLD/sJtmxm4DMmeHKM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754033160; c=relaxed/simple;
	bh=7PiiKDsEXWHf4AEFk62GK8aanigmQQ5YqDbpDky5qA8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e+xNo2nujwyrqv0/wxHNkVltj5CT30txYwfbvVFk1QCyYbTF4PYsxrpVRqgU0aM+0Qtsxtel1t+HbUZxLm4c4OZAWem4L2TPZCFCv63Dpw9/DBZCET/tVVXIhDmq0Duoe4e/sKjfiiQcPC0HEq3aKgosX4Gb8h05PvoGce11BLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LAfMG8dC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LAfMG8dC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4EF99C4CEE7;
	Fri,  1 Aug 2025 07:25:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754033159;
	bh=7PiiKDsEXWHf4AEFk62GK8aanigmQQ5YqDbpDky5qA8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LAfMG8dCt4wYVjkqdXLIIm9t84Ts6ZC+0Pk9CRCwlMJXieEjDN3O/QppXF0DYemyI
	 XrahC2PU0Ua5TyVGl2T4zhAOu8RIEtDHEVaXwF9kvb4LKFR/g8WDptPPe6wYkr7BlK
	 t9VcdqzYFEB6+y75M2C329wNQAJjelFZphq6Gr2dY8iYWpDLLsC3KMQHupBq+x/4z+
	 UmwYceeroxI3xfhML6cRncxRNnDehc9p7kccQltJzCbIIv6M+gA2bVfXKnzsPHSdIh
	 NQ0dGkYe7ktvevPpUWkcdeKfu8nKeP7sWzKURh/luksuq3COUHwsKoCQYMJLkRBqwc
	 uFqAaNJv1jksg==
Date: Fri, 1 Aug 2025 07:25:55 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: bleung@chromium.org, dawidn@google.com, chrome-platform@lists.linux.dev,
	mhiramat@kernel.org
Subject: Re: [PATCH v3 5/8] platform/chrome: Introduce cros_ec_device_alloc()
Message-ID: <aIxsA3-y75nE01U_@google.com>
References: <20250721044456.2736300-1-tzungbi@kernel.org>
 <20250721044456.2736300-6-tzungbi@kernel.org>
 <2025072114-unifier-screen-1594@gregkh>
 <aIIDz_qtbRjZB8Sg@google.com>
 <2025072428-marathon-anemia-c9f6@gregkh>
 <aII10fnhJRDeGSHI@google.com>
 <2025072537-sanction-overload-8acd@gregkh>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2025072537-sanction-overload-8acd@gregkh>

On Fri, Jul 25, 2025 at 06:58:23AM +0200, Greg KH wrote:
> On Thu, Jul 24, 2025 at 01:32:01PM +0000, Tzung-Bi Shih wrote:
> > On Thu, Jul 24, 2025 at 12:36:18PM +0200, Greg KH wrote:
> > > NEVER attempt to increment/decrement refcounts on open/release.  That
> > > way lies madness and should not be needed at all, the underlying
> > > infrastructure should keep things working properly here, right?
> > [...]
> You are attempting to have one reference count for one object that has
> different lifecycles.  That doesn't work well, if at all.  See the
> numerous talks at the Linux Plumbers conference over the past few years
> about why this is a "bad idea" and for ideas on how to redesign it to
> fix the issue.
> 
> Hint, 2 objects, different reference counts :)

Referenced the talk [1] and its related works and hope I understand it
correctly.

[1] https://lpc.events/event/17/contributions/1627/

Summarize the proposed fix and I hope it makes sense:

Introduce a new helper: ref_proxy for managing "weak" references to the
object that may be gone at any time.  `ref` is the target pointer (i.e.
the resource) which could be released asynchronously (from the resource
consumers' point of view).  The struct ref_proxy_struct is for resource
providers and is only freed on dropping the final reference.

  +struct ref_proxy_struct {
  +       struct srcu_struct srcu;
  +       void __rcu *ref;
  +       struct kref kref;
  +};
  +
  +struct ref_proxy_struct *ref_proxy_struct_alloc(void *ref)
  +{
  +       struct ref_proxy_struct *rp;
  +
  +       rp = kzalloc(sizeof(*rp), GFP_KERNEL);
  +       if (!rp)
  +               return NULL;
  +
  +       init_srcu_struct(&rp->srcu);
  +       rcu_assign_pointer(rp->ref, ref);
  +       synchronize_srcu(&rp->srcu);
  +       kref_init(&rp->kref);
  +
  +       return rp;
  +}
  +EXPORT_SYMBOL(ref_proxy_struct_alloc);
  +
  +static void ref_proxy_struct_release(struct kref *kref)
  +{
  +       struct ref_proxy_struct *rp = container_of(kref, struct ref_proxy_struct, kref);
  +
  +       cleanup_srcu_struct(&rp->srcu);
  +       kfree(rp);
  +}
  +
  +void ref_proxy_struct_free(struct ref_proxy_struct *rp)
  +{
  +       rcu_assign_pointer(rp->ref, NULL);
  +       synchronize_srcu(&rp->srcu);
  +       kref_put(&rp->kref, ref_proxy_struct_release);
  +}
  +EXPORT_SYMBOL(ref_proxy_struct_free);

The struct ref_proxy is for resource consumers.  It holds a reference to
the ref_proxy_struct during its lifetime.

  +struct ref_proxy {
  +       struct ref_proxy_struct *rp;
  +       int idx;
  +};
  +
  +struct ref_proxy *ref_proxy_alloc(struct ref_proxy_struct *rp)
  +{
  +       struct ref_proxy *proxy;
  +
  +       proxy = kzalloc(sizeof(*proxy), GFP_KERNEL);
  +       if (!proxy)
  +               return NULL;
  +
  +       proxy->rp = rp;
  +       kref_get(&rp->kref);
  +
  +       return proxy;
  +}
  +EXPORT_SYMBOL(ref_proxy_alloc);
  +
  +void ref_proxy_free(struct ref_proxy *proxy)
  +{
  +       struct ref_proxy_struct *rp = proxy->rp;
  +
  +       kref_put(&rp->kref, ref_proxy_struct_release);
  +       kfree(proxy);
  +}
  +EXPORT_SYMBOL(ref_proxy_free);

When a resource consumer needs to reference the resource, it gets the
pointer via ref_proxy_get() which entering a RCU critical section and
puts the pointer via ref_proxy_put() which leaving the critical section
afterward.

  +void *ref_proxy_get(struct ref_proxy *proxy)
  +{
  +       struct ref_proxy_struct *rp = proxy->rp;
  +       void *ref;
  +
  +       proxy->idx = srcu_read_lock(&rp->srcu);
  +
  +       ref = rcu_dereference(rp->ref);
  +       if (!ref)
  +               srcu_read_unlock(&rp->srcu, proxy->idx);
  +
  +       return ref;
  +}
  +EXPORT_SYMBOL(ref_proxy_get);
  +
  +void ref_proxy_put(struct ref_proxy *proxy)
  +{
  +       struct ref_proxy_struct *rp = proxy->rp;
  +
  +       srcu_read_unlock(&rp->srcu, proxy->idx);
  +}
  +EXPORT_SYMBOL(ref_proxy_put);

The resource provider (e.g. cros_ec_spi) should provide a ref_proxy on
probing and free the ref_proxy on removing.

  @@ -770,0 +772,4 @@ static int cros_ec_spi_probe(struct spi_device *spi)
  +       ec_dev->ref_proxy = ref_proxy_struct_alloc(ec_dev);
  +       if (!ec_dev->ref_proxy)
  +               return -ENOMEM;
  +

   static void cros_ec_spi_remove(struct spi_device *spi)
   {
          struct cros_ec_device *ec_dev = spi_get_drvdata(spi);
  
  +       ref_proxy_struct_free(ec_dev->ref_proxy);
          cros_ec_unregister(ec_dev);
   }

The resource consumer (e.g. cros_ec_chardev) should create an instance of
ref_proxy and tie to its local lifecycle.  It should get the pointer before
accessing.  It indicates the resource is no longer available if the
returning pointer is NULL.

  @@ -166,7 +187,10 @@ static int cros_ec_chardev_open(struct inode *inode, struct file *filp)
          if (!priv)
                  return -ENOMEM;
  
  -       priv->ec_dev = ec_dev;
  +       priv->ec_dev_proxy = ref_proxy_alloc(ec_dev->ref_proxy);
  +       if (!priv->ec_dev_proxy)
  +               return -ENOMEM;
  +
          priv->cmd_offset = ec->cmd_offset;
          filp->private_data = priv;
          INIT_LIST_HEAD(&priv->events);

  @@ -251,11 +276,16 @@ static ssize_t cros_ec_chardev_read(struct file *filp, char __user *buffer,
   static int cros_ec_chardev_release(struct inode *inode, struct file *filp)
   {
          struct chardev_priv *priv = filp->private_data;
  -       struct cros_ec_device *ec_dev = priv->ec_dev;
  +       struct cros_ec_device *ec_dev;
          struct ec_event *event, *e;
  
  -       blocking_notifier_chain_unregister(&ec_dev->event_notifier,
  -                                          &priv->notifier);
  +       ec_dev = ref_proxy_get(priv->ec_dev_proxy);
  +       if (ec_dev) {
  +               blocking_notifier_chain_unregister(&ec_dev->event_notifier,
  +                                                  &priv->notifier);
  +               ref_proxy_put(priv->ec_dev_proxy);
  +       }
  +       ref_proxy_free(priv->ec_dev_proxy);

  @@ -64,7 +66,11 @@ static int ec_get_version(struct chardev_priv *priv, char *str, int maxlen)
          msg->command = EC_CMD_GET_VERSION + priv->cmd_offset;
          msg->insize = sizeof(*resp);

  -       ret = cros_ec_cmd_xfer_status(priv->ec_dev, msg);
  +       ec_dev = ref_proxy_get(priv->ec_dev_proxy);
  +       if (!ec_dev)
  +               return -ENODEV;
  +       ret = cros_ec_cmd_xfer_status(ec_dev, msg);
  +       ref_proxy_put(priv->ec_dev_proxy);
          if (ret < 0) {
                  snprintf(str, maxlen,
                           "Unknown EC version, returned error: %d\n",
